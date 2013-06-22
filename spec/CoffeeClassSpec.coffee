define [], ->

	expect = chai.expect
	describe 'Coffeescript class inheritance', ->

		class Person
			constructor: (@name = 'A person') ->
			dance: -> 'can\'t dance'
			say: (something) -> something or @name

		it 'should create an instance', ->
			person = new Person
			person.should.be.ok
			person.should.be.an.instanceOf Person

		it 'should call instance methods', ->
			ordinaryGuy = new Person
			ordinaryGuy.say().should.be.equal 'A person'
			ordinaryGuy.say('hello').should.be.equal 'hello'

			name = 'Mr. Budi'
			businessMan = new Person name
			businessMan.should.be.ok
			businessMan.say().should.be.equal name

			businessMan.should.not.be.equal ordinaryGuy

		it 'should call constructors', ->
			class Test
				constructor: (check) ->
					check.should.be.true

			test = new Test true

			class SubTest extends Test
				constructor: ->	super true

			subTest = new SubTest

		class Ninja extends Person
			constructor: ->	super 'A ninja'
			dance: -> super()
			swingSword: -> 'swings a katan'
			say: -> super '...'			

		it 'should check inheritances with instanceOf', ->
			Person.should.not.equal Ninja

			person = new Person
			ninja = new Ninja

			person.should.be.an.instanceof Person
			person.should.not.be.an.instanceof Ninja
			ninja.should.be.an.instanceof Ninja
			ninja.should.be.an.instanceof Person

		it 'should have constructor accessible', ->
			hatori = new Ninja
			hatori.constructor.should.be.equal Ninja
			hatori.constructor.prototype.should.be.equal Ninja.prototype
			hatori.constructor.should.not.be.equal Person
			hatori.constructor.prototype.should.not.be.equal Person.prototype

		it 'should allow to create instance from constructor', ->
			hatori = new Ninja
			fuma = new hatori.constructor()
			hatori.say().should.be.equal fuma.say()
			hatori.should.not.be.equal fuma

		it 'should access parent methods', ->
			class Greeter extends Person
				say: -> super() + ' greets you'

			person = new Person
			ninja = new Ninja
			greeter = new Greeter 'Greeter'

			person.say().should.be.equal 'A person'
			person.dance().should.be.equal 'can\'t dance'
			ninja.say('something').should.be.equal '...'
			ninja.swingSword().should.be.equal 'swings a katan'
			greeter.say().should.be.equal 'Greeter greets you'
