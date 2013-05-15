console.log("rss,heapUsed,heapTotal,checktime")
function logMemory() {
  var m = process.memoryUsage()
  console.log("%s,%s,%s,%s", m.rss, m.heapUsed, m.heapTotal, (new Date()).toString())
}

logMemory()
setInterval(logMemory, 10000)