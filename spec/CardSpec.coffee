expect = chai.expect

describe "Card model", ->
	it "should be defined as module", (done) ->
		require ['base/Card'], (BaseCard) -> 
			expect(BaseCard).to.exist
			done()