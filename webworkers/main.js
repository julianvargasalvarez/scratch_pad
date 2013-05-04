var worker;
console.log("Hello");
runInWebWorker();

function runInWebWorker() {
  if(!worker && window.Worker) {
    worker = new Worker('longjob.js');
    if(worker) {
      worker.addEventListener('message', function(e) {
        console.log("longJob returned: " + e.data);
      });
    }
    worker.postMessage(5);
  }
  else
    console.log("Web Workers are not Supported in this Browser.");
}
