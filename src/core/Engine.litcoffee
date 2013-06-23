Engine
======
	define ['Classy'], (Classy) -> Engine = Classy.$extend()

Central point where everything begins. Usually there will be exactly one Engine running, but it's not limited in any way to have more Engines active. 

All the Systems required for the game have to be added to the Engine. 

Engine should take care of main game loop and sychroniz

