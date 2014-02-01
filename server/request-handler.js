var helper = require("./helper.js");
var url = require("url");
//data variable
var data = [];
//objectID counter start
var objectId = 0;

exports.getHandler = function(request, response) {
  
  var dataURLs = {
     "/classes/room1" : true,
     "/classes/messages" : true
  };
  var parsedUrl = url.parse(request.url, true);
  var queryString = parsedUrl.queryString;
  var urlPath = parsedUrl.pathname;

  console.log("Serving request type " + request.method + " for url " + request.url);
  console.log(parsedUrl);

  if( dataURLs[urlPath] ){
    helper.sendResponse(response, 200, queryString);
  }else{
    if( urlPath === '/' ){
     urlPath = '/index.html';
    }
    helper.serveLocal(response, urlPath);
  }

  
};

exports.postHandler = function(req, res){
  helper.collectData(req, function(message){
    message.objectId = objectId++;
    data.push(message);
  });
}

var methods = {
  'GET' : exports.getHandler,
  'POST' : exports.postHandler
  //'OPTIONS' : corsOptions
}

exports.handleRequest = function(req, res){
    var method = methods[req.method]; 
    console.log(req.method);
    method ? method(req,res) : helper.send404(err, res);
}
/* These headers will allow Cross-Origin Resource Sharing (CORS).
 * This CRUCIAL code allows this server to talk to websites that
 * are on different domains. (Your chat client is running from a url
 * like file://your/chat/client/index.html, which is considered a
 * different domain.) */