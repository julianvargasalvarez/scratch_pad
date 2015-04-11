var express = require('express');
var app = express();

app.get('/', function(req, res){
  res.type('text/plain');
  res.send('big hero 6');
});

app.get('/doit', function(req, res){
  res.type('text/plain');
  res.send('it is done!');
});

app.get('/stopit', function(req, res){
  res.type('text/plain');
  res.send('ok, good bye');
});

app.listen(3000);
