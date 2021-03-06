System
======
Handles various game logic and mechanics that can happen. Each System should be responsible for some rather small part of whole game and should be completely separate part of game. Communication with other System directly is forbidden.

    define ['Classy'], (Classy) -> System = Classy.$extend()

To be able do something, System usually need to communicate with Entity that has required Aspects. It can work with data connected to Entity and do some math with them, use them to render or just alter them so some other System can do its job. 

System should never communicate directly with Entity, but rather grab bunch of Nodes and do its job on them. It makes System's logic to have prepared list of Nodes ensuring, that Entity really has required Aspects. Otherwise it would need to loop through all existing Entities and check for Aspects before doing its job. This is essential especially in timed updates.
