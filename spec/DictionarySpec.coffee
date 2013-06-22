define [
	'chai'
	'core/Dictionary'
	'Classy'
], (chai, Dictionary, Classy) ->

	describe 'Dictionary', ->

		dict = null

		testMethodThrow = (method, errMessage, value) ->
			dict.should.respondTo method
			ex = new Dictionary.exceptionClass errMessage
			(-> dict[method](value)).should.throw ex

		beforeEach ->
			dict = new Dictionary

		it 'should be defined and can be constructed', ->
			dict.should.be.an.instanceOf Dictionary

		describe '#indexOf', ->

			it 'should accept only non-null keys', ->
				testMethodThrow('indexOf', Dictionary.invalidKey) 

			it 'should return index -1 for unknown key', ->
				dict.indexOf('unknownKey').should.be.equal -1

		describe '#add', ->

			it 'should add key/value pair and return it\'s index', ->
				testMethodThrow('add', Dictionary.invalidKey) 

				idx = dict.add 'someKey', 'someValue'
				idx.should.be.equal 0
				dict.indexOf('someKey').should.be.equal 0

				idx = dict.add 'otherKey', 'otherValue'
				idx.should.be.equal 1
				dict.indexOf('otherKey').should.be.equal 1

		describe '#has', ->

			it 'should check for key existence', ->
				testMethodThrow('has', Dictionary.invalidKey) 

				chai.expect(dict.get 'someKey').to.be.null
				dict.has('someKey').should.be.false
				dict.add 'someKey'
				dict.has('someKey').should.be.true

		describe '#get', ->

			it 'should retrieve value for the key', ->
				testMethodThrow('get', Dictionary.invalidKey) 

				dict.add 'someKey', 'someValue'
				dict.get('someKey').should.be.equal 'someValue'

			it 'should return updated value when adding existing key', ->
				dict.add 'someKey', 'someValue'
				dict.get('someKey').should.be.equal 'someValue'
				dict.add 'someKey', 'newValue'
				dict.get('someKey').should.be.equal 'newValue'

		describe '#remove', ->

			it 'should remove key/value pair', ->
				testMethodThrow('remove', Dictionary.invalidKey) 
				testMethodThrow('remove', Dictionary.unknownKey, 'someKey') 

				dict.add 'someKey', 'someValue'
				dict.remove 'someKey'
				dict.has('someKey').should.be.false

		describe '#forEach', ->

			beforeEach ->
				dict = new Dictionary
				dict.add 'firstKey', 'firstValue'
				dict.add 'secondKey', 'secondValue'
				dict.add 'thirdKey', 'thirdValue'

			it 'should accept only valid iterator function', ->
				testMethodThrow('forEach', Dictionary.noIterator) 

				badIterator = -> throw "bad iterator"
				testBadIterator = -> dict.forEach badIterator
				error = new Dictionary.exceptionClass Dictionary.iteratorFail, 'bad iterator'
				testBadIterator.should.throw error

			it 'should iterate all items and return true', ->
				spy = sinon.spy()
				dict.forEach(spy).should.be.true
				spy.should.have.been.calledThrice
				spy.should.have.been.calledWith 'secondKey'

			it 'should return false when iterator function returns true and stop the loop', ->
				spy = sinon.spy (key) ->
					key is 'secondKey'
				dict.forEach(spy).should.be.false
				spy.should.have.been.calledTwice
				spy.should.not.have.been.calledWith 'thirdKey'


