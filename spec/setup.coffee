require.config
	baseUrl: "../"
	paths:
		"core": "src/core"
		"Signals": "lib/signals"

mocha.setup
	ui: "bdd"
	globals: ["Signals"]

should = chai.should()
chai.use

require [
	'node_modules/chai-spies/chai-spies'
	#'spec/ClassSpec'
	'spec/DictionarySpec'
], (spies) -> 
	chai.use(spies)
	mocha.run()