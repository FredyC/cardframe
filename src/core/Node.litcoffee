Node
====
Serves like bridge between System and Entity. As Entity can contain many Aspects, System usually cares about small subset of them. Node wraps that subset and offers it to the System for any work it has to do. Once Entity is missing any part of that subset, Node is released and System doesn't care about that Entity anymore.

    define ['Classy'], (Classy) -> Node = Classy.$extend

Node is tightly coupled to one and only Entity. Once the Entity ceases to exist, Node goes away too.

		entity: null # Entity