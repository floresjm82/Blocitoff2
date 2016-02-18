require 'rails_helper'

RSpec.describe Item, type: :model do

	let(:item) {Item.create!(name: "Testing 123")}

	it {should belong_to(:user)}
  	it {should validate_presence_of(:name)}
  	it {should validate_length_of(:name).is_at_least(100)}

	describe "attributes" do
		it "should respond to name" do
			expect(item).to respond_to(:name)
		end

	end





end
