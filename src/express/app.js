var express = require('express');
var app = express();

var proxy = '';

app.set('views', __dirname + '/views');

app.get(proxy +'/', function(req, res){
	res.sendfile('views/index.html');
});

app.get(proxy +'/test', function(req, res){
	res.end("hello test world!\n");
});

app.listen(3030);
console.log('http://localhost:3030/');