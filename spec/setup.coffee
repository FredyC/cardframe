require.config
	baseUrl: "../src"
	paths:
  		"backbone": "../node_modules/backbone/backbone"
  		"underscore": "../node_modules/underscore/underscore"
  	shim:
	    "backbone": 
	    	deps: ["underscore"]
	    	exports: "Backbone"
	    "underscore":
	    	exports: "_"

mocha.setup
	globals: ["Backbone", "_"]
