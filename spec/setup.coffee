require.config
	baseUrl: "../"
	paths:
		"Classy": "lib/classy/classy"
		"core": "src/core"
		"chai": "node_modules/chai/chai"

mocha.setup
	ui: "bdd"
	globals: ["Signals"]

require [
	'chai'
	'node_modules/sinon-chai/lib/sinon-chai'
	'node_modules/sinon/pkg/sinon'
	#'spec/CoffeeClassSpec'
	'spec/ClassySpec'
	'spec/DictionarySpec'
	
], (chai, sinonChai) -> 
	chai.should()
	chai.use(sinonChai)
	mocha.run()