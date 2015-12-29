require 'rails_helper'

RSpec.describe ItemsController, type: :controller do

  let(:my_item) {Item.create!(name: "Testing123")}

  it {should belong_to(:user)}
  it {should validate_presence_of(:name)}
  it {should validate_length_of(:name).is_at_least(100)}

  describe "POST create" do
#1 expect the count of Item instances in the database to increase by one.
  	it "increases the number of Item by 1" do
  		expect{post :create, item: {name: Faker::Lorem.sentence}}.to change(Item,:count).by(1)
  	end
#1 when create is POSTed to, we expect the newly created item to be assigned to @item
    it "assigns the new item to @item" do
    	expect(assigns(:item)).to eq Item.last
    end
#1 we expect to be redirected to the newly created item.
    it "redirects to the new item" do
    	post :create, item: {name: Faker::Lorem.sentence}
    	expect(response).to redirect_to Item.last
    end
  end

  describe "DELETE destroy" do
    it "deletes the item" do
      delete :destroy, {id: my_item.id}
#2 we searched the database for a post with an id equal to my_item.id, returning an array and assigning the size of the array to "count".
# "count" should equal to zero.
      count = Item.where({id: my_item.id}).size
      expect(count).to eq 0
    end
=begin
Ajax changed this test
    it "redirects to current_user" do
      delete :destroy, {id: my_item.id}
#3 post will be redirected to current_user (user's show page)
      expect(response).to redirect_to current_user
    end
  end
=end
  end

end
