const handler = (event, _, callback) => {
  console.dir(event)
  callback(null, { success: true })
}

module.exports = {
  handler
}