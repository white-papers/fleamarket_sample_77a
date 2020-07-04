require 'rails_helper'

RSpec.describe "Streetaddresses", type: :request do

  describe "GET /edit" do
    it "returns http success" do
      get "/streetaddresses/edit"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /update" do
    it "returns http success" do
      get "/streetaddresses/update"
      expect(response).to have_http_status(:success)
    end
  end

end
