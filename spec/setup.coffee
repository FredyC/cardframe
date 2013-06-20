require.config
	baseUrl: "../src"
	paths:
  		"backbone": "../node_modules/backbone/backbone-min"
  		"underscore": "../node_modules/underscore/underscore-min"
  		"spec": "../spec"
  	shim:
	    "backbone": 
	    	deps: ["underscore"]
	    	exports: "Backbone"
	    "underscore":
	    	exports: "_"

mocha.setup
	globals: ["Backbone", "_"]

require [
	'spec/CardSpec'
], (specs...) ->
	#spec() for spec in specs