CardFrame - Card games framework
=========
Javascript framework for testing, developing and playing games based on cards.

Initial idea for this came from my personal need to test my own custom card game. However it became rather tediou to create all the game elements physically and than meet with people to test the game.

What is it about ?
----
Goal of this is to have simple and **scalable** framework, that can be extended in many ways and allow to define different set of *game cards*, *decks*, *areas on game board* and *game rules*.

Architecture will be entity based inspired by great [Ash Framework](http://www.ashframework.org/) by [Richard Lord](http://www.richardlord.net). 

On of there further goals is to have **repository** with various card sets, rules and rendering engines, so literally any game could be assembled quite easily. Entity framework should allow that quite easily.

Card games can be displayed in various ways and framework should handle that too. Eventually it should be able to display and play the game in **2D/3D environment, mobile devices** or even completely **text based** for shell fans.

For testing games it's really useful to have some friends or even completely anonymous people. Framework will offer networking capability so anybody could host the game for others.