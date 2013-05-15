var http = require("http")

console.log("rss,heapUsed,heapTotal,checktime")
function sendMemory() {
  var m = process.memoryUsage()
  post(m, function () {
    console.log("%s,%s,%s,%s", m.rss, m.heapUsed, m.heapTotal, (new Date()).toString())
  })
}

var options = {
  hostname: "localhost",
  port: 7101,
  path: "/",
  method: "POST",
  agent: false,
}

function post(data, cb) {
  var txt = JSON.stringify(data)
  options.headers = {"Content-Length": txt.length}

  var req = http.request(options, function(res) {
    //console.log("statusCode: ", res.statusCode)
    //console.log("headers: ", res.headers)

    res.on("data", function(d) {
      //process.stdout.write(d)
    })
    res.on("end", function () {
      cb()
    })
  })
  req.write(txt)
  req.end()

  req.on("error", function(e) {
    console.error(e)
  })
}

sendMemory()
setInterval(sendMemory, 10000)
