var fs = require("fs");
var path = require("path");

exports.headers = {
  "access-control-allow-origin": "*",
  "access-control-allow-methods": "GET, POST, PUT, DELETE, OPTIONS",
  "access-control-allow-headers": "X-Requested-With, content-type, accept",
  "access-control-max-age": 10, // Seconds.
};

exports.sendResponse  = function(response, status, queryString){
  status = status || 200;
  response.writeHead(status, {"content-type": "application/json"} );
  response.end( JSON.stringify( {"username" : "kwyn" , "text" : "fake message"} ) );
};

exports.serveLocal = function(res, urlPath){
  fs.readFile(path.join(__dirname, urlPath) , function(err, data){
    if(err){
      exports.send404(err, res);
    }else{
      res.writeHead(200, exports.headers);
      res.end(data);
    }
  });
  
}

var corsOptions = function(request, response) {
  helpers.sendResponse(response, null);
}

exports.collectData = function(callback, request){
  request.on('data', function(chunk){
    collected += chunk;
  });
  request.on('end', function(){
    callback( JSON.parse(collected) );
  });
};

exports.send404 = function(err, res){
  console.log(err);
  res.writeHead(404, null);
  res.end("Error 404: not found");
};


