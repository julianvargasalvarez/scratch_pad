function longJob(n) {
  var start = new Date();
  var elapsedSeconds = 0;
  while(elapsedSeconds < n) {
    var v = 0;
    for(var i=0; i < 1000000; i++) v += i;
    var end = new Date();
    elapsedSeconds = (end.getTime() - start.getTime())/1000.0;
  }
  return "All Done in " + elapsedSeconds + " seconds.";
}

self.addEventListener('message', function(e) {
  var result = longJob(e.data);
  self.postMessage(result);
}, false);
