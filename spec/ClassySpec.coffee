define ['Classy'], (Classy) ->

	expect = chai.expect
	describe 'Classy inheritance', ->

		it 'should be defined', ->
			Classy.should.exist
			Classy.should.be.a 'Function'
			Classy.should.itself.respondTo '$extend'

		Person = Classy.$extend
			__init__: (@name = 'A person') ->
			dance: -> 'can\'t dance'
			say: (something) -> something or @name

		it 'should create an instance & call __init__', ->
			person = new Person
			person.should.be.ok
			person.should.be.an.instanceOf Person
			person.should.have.property 'name', 'A person'

		it 'should create instance without `new` keyword', ->
			human = Person('A human')
			human.should.be.an.instanceOf Person

		it 'should call __init__ just once w/o using `new`', ->
			catched = []
			Test = Classy.$extend
				__init__: -> catched.push true

			Test()
			new Test()
			catched.should.have.length 2

		it 'should call instance methods', ->
			ordinaryGuy = new Person
			ordinaryGuy.should.respondTo 'say'
			ordinaryGuy.say().should.equal 'A person'
			ordinaryGuy.say('hello').should.equal 'hello'

			name = 'Mr. Budi'
			businessMan = new Person name
			businessMan.should.be.ok
			businessMan.say().should.equal name

			businessMan.should.not.equal ordinaryGuy

		Ninja = Person.$extend
			__init__: -> @$super 'A ninja'
			swingSword: -> true
			say: -> @$super '...'

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
			hatori.$class.should.equal Ninja
			hatori.$class.should.not.equal Person

		it 'should allow to create instance from constructor', ->
			hatori = new Ninja
			fuma = new hatori.$class
			hatori.say().should.equal fuma.say()
			hatori.should.not.equal fuma

		it 'should access parent methods', ->
			Master = Ninja.$extend
				dance: -> @name + " is watching master"
				say: -> @$super() + '!'
				swingSword: -> false

			person = new Person
			ninja = new Ninja
			master = new Master 'Master'

			person.say().should.equal 'A person'
			person.dance().should.equal 'can\'t dance'
			ninja.say('something').should.equal '...'
			ninja.dance().should.equal 'can\'t dance'
			ninja.swingSword().should.be.true
			master.say().should.equal '...!'
			master.swingSword().should.be.false
			master.dance().should.equal 'A ninja is watching master'

		it 'should have mixin working', ->
			OldMixin =
				'is_old': true
				'describe': -> @name + ' is old!'

			OldPerson = Person.$extend
				__include__: [OldMixin]

			elder = OldPerson 'Garry'
			elder.should.have.property "is_old", true
			elder.should.not.have.ownProperty "is_old"
			elder.should.respondTo 'describe'
			elder.describe().should.equal 'Garry is old!'

		it 'should patch the prototypes correctly', ->
			called = []
			Test = Classy.$extend
				__init__: -> called.push 42
				getFoo: -> @foo
				toString: -> @foo + ' ' + @bar

			data = foo: 23, bar: 42
			obj = Test.$withData data
			obj.should.have.ownProperty "foo", 23
			obj.should.have.ownProperty "bar", 42
			obj.should.respondTo 'getFoo'
			obj.getFoo().should.equal obj.foo

			called.should.have.length 0, '__init__ should not be called'

		it 'should inherit class variables', ->
			Test = Classy.$extend
				__classvars__:
					foo: 23
					bar: 'test'

			SubTest = Test.$extend
				__classvars__:
					bar: 'subtest'

			SubSubTest = SubTest.$extend
				__classvars__:
					foo: 999

			SubTest.should.have.property 'foo', 23
			SubTest.should.have.ownProperty 'bar', 'subtest'
			SubSubTest.should.have.property 'bar', 'subtest'
			SubSubTest.should.have.ownProperty 'foo', 999
