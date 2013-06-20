require.config
	baseUrl: '../src'
	paths: 
		Underscore: '../node_modules/underscore/underscore'
		Backbone: '../node_modules/backbone/backbone'

	shim:
		'Backbone': ['Underscore']

mocha.setup 'bdd'
#chai.use 'chai-spies'
