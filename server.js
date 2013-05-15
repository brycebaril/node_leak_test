var http = require("http")
var https = require("https")
var fs = require("fs")

var httpPort = 7101
var httpsPort = 7301

console.log("rss,heapUsed,heapTotal,checktime")
var handle = function (req, res) {
  res.writeHead(202, {"Content-Type": "text/plain"})
  res.end("OK")
  var m = process.memoryUsage()
  console.log("%s,%s,%s,%s", m.rss, m.heapUsed, m.heapTotal, (new Date()).toString())
}

http.createServer(handle).listen(httpPort, function () {
//  console.log("http server listening at http://localhost:%s", httpPort)
})


var options = {
  key: fs.readFileSync("CA/key.pem"),
  cert: fs.readFileSync("CA/cert.pem"),
}

https.createServer(options, handle).listen(httpsPort, function () {
//  console.log("https server listening at https://localhost:%s", httpsPort)
})
