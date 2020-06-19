class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:family_name, :given_name, :family_name_kana, :given_name_kana, :birthday, :postal_code, :prefectures, :city, :address, :building, :phone_number])
  end  
end
