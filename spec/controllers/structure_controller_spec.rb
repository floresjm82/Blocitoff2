require 'rails_helper'

RSpec.describe StructureController, type: :controller do

  describe "GET main_page" do
    it "returns http success" do
      get :main_page
      expect(response).to have_http_status(:success)
    end
  end

end


