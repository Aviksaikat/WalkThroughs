// Including zlib module
const zlib = require("zlib");


b64string = byte("eJwrzy_Kji8oys9Ps03OyMhITMtIKy8tNi62tMxIyTAzTEwtTc1IT81IzcgwBgB07hBs==");
var buf = Buffer.from(b64string, 'base64');
   
// Calling deflate method
zlib.deflate(buf, (err, buffer) => {
   
  // Calling inflate method
  zlib.inflate(buffer, (err, buffer) => {
    console.log(buffer.toString('utf8'));
  });
});