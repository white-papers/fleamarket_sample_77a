require 'rails_helper'
require 'spec_helper'
describe Users::RegistrationsController, type: :controller do

  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      get :new
      expect(response).to render_template :new
    end
  end
end  