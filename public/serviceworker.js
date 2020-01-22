self.addEventListener('push', event => {
  const data = event.data.text()
  const json = JSON.parse(data)
  event.waitUntil(
    self.registration.showNotification(json.title, { body: json.body })
  )
})
