require 'rails_helper'

RSpec.describe "Deliveryaddresses", type: :request do

  describe "GET /edit" do
    it "returns http success" do
      get "/deliveryaddresses/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/deliveryaddresses/update"
      expect(response).to have_http_status(:success)
    end
  end

end
