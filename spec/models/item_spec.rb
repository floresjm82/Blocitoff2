require 'rails_helper'

RSpec.describe Item, type: :model do

	let(:item) {Item.create!(name: "Testing 123")}

	describe "attributes" do
		it "should respond to name" do
			expect(item).to respond_to(:name)
		end

	end





end
