const handler = (event, _, callback) => {
  var response = {
    statusCode: 200,
    headers: {
        'Content-Type': 'text/html; charset=utf-8',
    },
    body: "<p>Hello world!</p>",
};
callback(null, response);
}

module.exports = {
  handler
}