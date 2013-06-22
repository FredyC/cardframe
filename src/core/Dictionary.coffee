###
Dictionary utility class.

@author FredyC <fredy.c@seznam.cz>
Inspired by Brett Jephson code contained in https://github.com/brejep/ash-js
Rewritten to Coffeescript using Classy (http://classy.pocoo.org/)
###

define ['Classy'], (Classy) ->
	ExceptionClass = Classy.$extend
		__init__: (@message, @inner) ->

	classvars = 
		exceptionClass: ExceptionClass
		invalidKey: 'Key for dictionary cannot be null'
		unknownKey: 'Key does not exist'
		noIterator: 'Need an iterator function'
		iteratorFail: 'Error encountered during iterator function'

	Dictionary = Classy.$extend
		# Internal storage for keys
		keys: null,
		# Internal storage for values
		values: null

		__init__: ->
			@keys = []
			@values = []

		__classvars__: classvars

		add: (key, value) ->
			keyIdx = @indexOf key
			if keyIdx >= 0
				@values[keyIdx] = value
			else
				@keys.push key
				@values.push value
				keyIdx = @keys.length - 1
			keyIdx

		remove: (key) ->
			keyIdx = @indexOf key
			throw @$class.exceptionClass @$class.unknownKey if keyIdx is -1
			@keys.splice keyIdx, 1
			@values.splice keyIdx, 1

		get: (key) ->
			keyIdx = @indexOf key
			return null if keyIdx is -1
			@values[keyIdx]

		has: (key) ->
			@indexOf(key) isnt -1

		indexOf: (key) ->
			unless key? then throw @$class.exceptionClass @$class.invalidKey
			for k, i in @keys 
				if key is k then return i
			-1

		forEach: (iterator) ->
			unless iterator? then throw @$class.exceptionClass @$class.noIterator
			for key, i in @keys
				value = @values[i]
				try
					return false if true is iterator key, value, i
				catch ex
					throw @$class.exceptionClass iteratorFail, ex

			return true
