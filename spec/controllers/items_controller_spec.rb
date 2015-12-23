include "rails_helper"

RSpec.describe ItemsController, type: :controller do

let(:my_item) {Item.create!(:name "Testing 123")}

  describe "POST create" do
#1 expect the count of Item instances in the database to increase by one.
  	it "increases the number of Item by 1" do
  		expect{post :create, item: {name: Faker::Lorem.sentence}}.to change(Item,:count).by(1)
  	end
#1 when create is POSTed to, we expec the newly created item to be assigned to @item
    it "assigns the new item to @item" do
    	expect(assigns(:item)).to eq Item.last
    end
#1 we expect to be redirected to the newly created item.
    it "redirects to the new item" do
    	post :create, item: {name: Faker::Lorem.sentence}
    	expect(response).to redirect_to Item.last
  end


end
