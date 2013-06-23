Aspect
======
To give some purpose to an [Entity](Entity.html) there has to be an Aspect.   Aspect itself doesn't decide how it will influence the [Entity](Entity.html). Its job is to keep list of properties that can be used by [System](System.html) to drive the logic.

	define ['Classy'], (Classy) -> Aspect = Classy.$extend()

Creating an Aspect
------------------------
Aspects can be rather simple objects. However it need some designation unique across the application, because [Node](Node.html) has to be able determine if [Entity](Entity.html) has required Aspects. 

Class itself is unique enough so it's the most straightforward approach and it's fully supported calling `Aspect.$extend()`. On other hand it's not really optimal to create new class for Aspect that contains simple data (eg. one number).

As the Javascript is rather benevolent to object types, it would be good to have some control over property types.

It's probably the most obvious way, but not necessarilly optimal. Aspect class can be simply derived and 

Aspects (and [Nodes](Node.html)) are rather simple objects and that means (for most of the cases) its creation can be simplified too.Instead of defining whole new class in separate file, it's easier to virtually just give a name to list of properties. See [MPropertyList](MPropertyList.html) for details on defining properties.

Aspect should not reference other Aspect in any way. These should be completely separate.



Then Aspect instance can be created by just passing up map of values to be stored in defined properties or it can be omitted if there are already default values for properties that are satisfactory.

Every Aspect has to be named so it can be referenced through the system easily.Name has to be unique across whole application structure. You can use any characters. It's recommended to stick with [CamelCase](http://searchsoa.techtarget.com/definition/UpperCamelCase) convention. If necessary, use namespacing to distingish between similar names.

Name of the Aspect should present short description of contained properties. It is usually similar to name of the [System](System.html) that is handling such Aspect.
