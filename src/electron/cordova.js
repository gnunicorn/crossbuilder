
// cordova.js is loaded from our index.html first
// it is the integration layer to our external APIs
const ref = require('ref');
const ffi = require('ffi');

(function() {
	const lib = ffi.Library(__dirname + '/../libhello_rust', {
	  'hello':  [ref.types.CString, [] ]
	})

	window.hello = {'greet': function(inp, success, error) {
		console.log(arguments)
		var res = lib.hello()
		console.log(res)
		success(res)
	}}
})()