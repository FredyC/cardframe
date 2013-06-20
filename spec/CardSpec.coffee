define ['base/Card'], (BaseCard) ->
	expect = chai.expect

	-> describe "Card model", ->
		it "should be defined as module", ->
			expect(BaseCard).to.exist