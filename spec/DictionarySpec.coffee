define ['core/Dictionary'], (Dictionary) ->

	expect = chai.expect
	describe 'Dictionary', ->

		dict = null
		error = 'Key for dictionary cannot be null'

		beforeEach ->
			dict = new Dictionary

		it 'should be defined and can be constructed', ->
			Dictionary.should.be.a 'Function'
			dict.should.be.ok
			dict.should.be.an.instanceOf Dictionary

		it 'should accept only non-null keys', ->
			dict.indexOf.should.be.a 'Function'

			testFunc = -> dict.indexOf(null)
			testFunc.should.throw error

		it 'should return index -1 for unknown key', ->
			dict.indexOf('unknownKey').should.be.equal -1

		it 'should add key/value pair and return it\'s index', ->
			dict.add.should.be.a 'Function'

			testFunc = -> dict.add(null)
			testFunc.should.throw error

			idx = dict.add 'someKey', 'someValue'
			idx.should.be.equal 0
			dict.indexOf('someKey').should.be.equal 0

		it 'should check for key existence', ->
			dict.has.should.be.a 'Function'

			testFunc = -> dict.has(null)
			testFunc.should.throw error

			dict.has('someKey').should.be.false
			dict.add 'someKey'
			dict.has('someKey').should.be.true

		it 'should retrieve value for the key', ->
			dict.get.should.be.a 'Function'

			testFunc = -> dict.get(null)
			testFunc.should.throw error

			dict.add 'someKey', 'someValue'
			dict.get('someKey').should.be.equal 'someValue'

		it 'should update value for existing key', ->
			dict.add 'someKey', 'someValue'
			dict.add 'someKey', 'newValue'
			dict.get('someKey').should.be.equal 'newValue'

		it 'should remove key/value pair', ->
			dict.remove.should.be.a 'Function'

			testFunc = -> dict.remove(null)
			testFunc.should.throw error

			testRemove = -> dict.remove('someKey')
			testRemove.should.throw 'Key does not exist'

			dict.add 'someKey', 'someValue'
			
			testRemove.should.not.throw 'Key does not exist'
			dict.has('someKey').should.be.false

		it 'should iterate over key/value pairs', ->
			dict.forEach.should.be.a 'Function'
