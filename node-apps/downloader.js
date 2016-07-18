var express = require('express');
var http = require('http');
var app = express();
var exec = require('child_process').exec;

// wget http://localhost:5000?file_path=http://localhost:3000/uploads/message/attached_file/38/WhatsApp-Image-20160713.jpeg

app.set('port', process.env.PORT || 5000);

app.get('/',function(request, response, next){
  console.log("baixando " + request.query.file_path + "...");
  exec('wget http://10.180.70.235:3000' + request.query.file_path);
  console.log("download completo!");
});

http.createServer(app).listen(app.get('port'), function(){
 console.log('Servidor de download iniciado ' + app.get('port'));
});