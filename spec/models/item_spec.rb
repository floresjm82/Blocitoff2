

RSpec.describe Item, type: :model do

	describe "attributes" do
		it "should respond to name" do
			item = Item.new
			expect(item).to respond_to(:name)
		end
	end

end
