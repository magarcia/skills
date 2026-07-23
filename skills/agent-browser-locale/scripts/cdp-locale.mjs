#!/usr/bin/env node

// Keep a CDP locale override alive for one Chrome page target.
// Requires Node 22+ for global fetch, WebSocket, and AbortSignal.timeout.

const locale = process.argv[2] ?? 'sv-SE'
const portOrWs = process.argv[3] ?? '9222'
const commandTimeoutMs = 5_000

if (!/^[A-Za-z]{2,3}(?:-[A-Za-z0-9]{2,8})*$/.test(locale)) {
  throw new Error(`Invalid locale: ${locale}`)
}

function assertLocalEndpoint(value) {
  const url = new URL(value)
  const localHosts = new Set(['localhost', '127.0.0.1', '[::1]'])
  if (!['http:', 'ws:', 'wss:'].includes(url.protocol)) {
    throw new Error(`Unsupported CDP protocol: ${url.protocol}`)
  }
  if (!localHosts.has(url.hostname)) {
    throw new Error(`Refusing non-local CDP endpoint: ${url.hostname}`)
  }
  return url
}

async function resolveWsUrl() {
  if (/^wss?:\/\//.test(portOrWs)) {
    return assertLocalEndpoint(portOrWs).toString()
  }

  if (!/^\d{1,5}$/.test(portOrWs)) {
    throw new Error(`Invalid CDP port: ${portOrWs}`)
  }

  const port = Number(portOrWs)
  if (port < 1 || port > 65_535) {
    throw new Error(`CDP port out of range: ${portOrWs}`)
  }

  const endpoint = assertLocalEndpoint(`http://127.0.0.1:${port}/json`)
  const response = await fetch(endpoint, {
    signal: AbortSignal.timeout(commandTimeoutMs),
  })
  if (!response.ok) {
    throw new Error(`CDP target request failed: HTTP ${response.status}`)
  }

  const targets = await response.json()
  const page = targets.find((target) => target.type === 'page')
  if (!page?.webSocketDebuggerUrl) {
    throw new Error(`No page target found on port ${port}`)
  }

  return assertLocalEndpoint(page.webSocketDebuggerUrl).toString()
}

function waitForOpen(socket) {
  return new Promise((resolve, reject) => {
    const timeout = setTimeout(
      () => reject(new Error('Timed out opening the CDP WebSocket')),
      commandTimeoutMs,
    )
    socket.addEventListener('open', () => {
      clearTimeout(timeout)
      resolve()
    }, { once: true })
    socket.addEventListener('error', () => {
      clearTimeout(timeout)
      reject(new Error('Failed to open the CDP WebSocket'))
    }, { once: true })
  })
}

function send(socket, id, method, params = {}) {
  return new Promise((resolve, reject) => {
    const timeout = setTimeout(() => {
      cleanup()
      reject(new Error(`Timed out waiting for ${method}`))
    }, commandTimeoutMs)

    const onMessage = (event) => {
      const message = JSON.parse(String(event.data))
      if (message.id !== id) return
      cleanup()
      resolve(message)
    }
    const onClose = () => {
      cleanup()
      reject(new Error(`CDP session closed while waiting for ${method}`))
    }
    const cleanup = () => {
      clearTimeout(timeout)
      socket.removeEventListener('message', onMessage)
      socket.removeEventListener('close', onClose)
    }

    socket.addEventListener('message', onMessage)
    socket.addEventListener('close', onClose, { once: true })
    socket.send(JSON.stringify({ id, method, params }))
  })
}

async function main() {
  const wsUrl = await resolveWsUrl()
  const socket = new WebSocket(wsUrl)
  await waitForOpen(socket)

  const response = await send(
    socket,
    1,
    'Emulation.setLocaleOverride',
    { locale },
  )
  if (response.error) {
    throw new Error(`setLocaleOverride failed: ${JSON.stringify(response.error)}`)
  }

  console.log(`setLocaleOverride ${locale}: ok`)
  console.log('Holding CDP session open. The override clears when this process exits.')

  let intentionalClose = false
  const stop = () => {
    intentionalClose = true
    socket.close()
  }
  process.once('SIGINT', stop)
  process.once('SIGTERM', stop)

  await new Promise((resolve, reject) => {
    socket.addEventListener('close', () => {
      if (intentionalClose) resolve()
      else reject(new Error('CDP session closed; locale override is no longer active'))
    }, { once: true })
    socket.addEventListener('error', () => {
      reject(new Error('CDP WebSocket error'))
    }, { once: true })
  })
}

main().catch((error) => {
  console.error(error.message)
  process.exitCode = 1
})
