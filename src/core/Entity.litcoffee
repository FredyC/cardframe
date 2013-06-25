Entity
======
It's every little piece of the game that is needed for game to work. Entity on its own is rather abstract without any real purpose. To give it purpose, it needs to be enriched by [Aspects](Aspect.html). Entity without any Aspect doesn't really exist, because no [System](System.html) will care about it.

    define ['Classy'], (Classy) -> Entity = Classy.$extend

Entity can be presented like small dot on the player screen, whole player character or gun mounted on spaceship. If your imagination allows it and one of the [Systems](System.html) can handle it, Entity of player character can be easily mounted on spaceship. There are virtually no limitations.

Under the hood, Entity is just the collection of [Aspects](Aspect.html) which designates how should be Entity handled. However that privilege is given to [System](System.html) only. 

Each Entity is allowed to have only one instance of the same [Aspect](Aspect.html). If there is need to change this, it's generally better to split Entity into more smaller ones.
	
		aspects: null # Dictionary<AspectName, AspectInstance>

Once the Aspect is added or removed to the Entity, rest of the world (at least that part that cares) should know about it. Let's expose some signals for that.

		aspectAdded: null # Signal
		aspectRemoved: null # Signal