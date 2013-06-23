MPropertyList
=============
Javascript is not exactly strongly typed language, but sometimes it's good to have some kind of control over this and handle typing properly. This is internal mixin to be used mainly by [Node](Node.html) and [Aspect](Aspect.html) classes to define it's set of properties with type control.

	define [], -> MPropertyList =

Method should be called within constructor of class, that wants to define it's properties this way.

		__setupProperties: (config) ->

It's using standardized Object.defineProperty which allow to define getter/setter methods for the property.