require 'rails_helper'

RSpec.describe User, type: :model do

	describe "attributes" do
		it "should respond to name" do
			item = Item.new
			expect(item).to respond_to(:name)
		end
	end

end
