###
Dictionary utility class.

Original author: Brett Jephson
Original code taken from: https://github.com/brejep/ash-js
Rewritten and modified to Coffeescript by FredyC
###

define [], ->
	invalidKey = 'Key for dictionary cannot be null'
	unknownKey = 'Key does not exist'

	class Dictionary
		# Internal storage for keys
		keys: null,
		# Internal storage for values
		values: null

		constructor: ->
			@keys = []
			@values = []

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
			throw unknownKey if keyIdx is -1
			@keys.splice keyIdx, 1
			@values.splice keyIdx, 1

		get: (key) ->
			keyIdx = @indexOf key
			return null if keyIdx is -1
			@values[keyIdx]

		has: (key) ->
			@indexOf(key) isnt -1

		indexOf: (key) ->
			unless key? then throw invalidKey
			for k, i in @keys 
				if key is k then return i
			-1
