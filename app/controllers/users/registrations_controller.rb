# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  layout 'index'
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      if params[:sns_auth] == 'true'
        pass = Devise.friendly_token
        params[:user][:password] = pass
        params[:user][:password_confirmation] = pass
      else
        flash.now[:alert] = @user.errors.full_messages
        render :new and return
      end
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @streetaddress= @user.build_streetaddress
    render :new_streetaddress   
  end

  def create_streetaddress
    @user = User.new(session["devise.regist_data"]["user"])
    @streetaddress = Streetaddress.new(streetaddress_params)
    unless @streetaddress.valid?
      flash.now[:alert] = @streetaddress.errors.full_messages
      render :new_streetaddress and return
    end
    @user.build_streetaddress(@streetaddress.attributes)
    session["streetaddress"] = @streetaddress.attributes
    @deliveryaddresses = @user.deliveryaddresses.build
    render :new_deliveryaddresses
  end

  def create_deliveryaddresses
    @user = User.new(session["devise.regist_data"]["user"])
    @streetaddress = Streetaddress.new(session["streetaddress"])
    @deliveryaddresses = Deliveryaddress.new(deliveryaddresses_params)
    unless @deliveryaddresses.valid?
      flash.now[:alert] = @deliveryaddresses.errors.full_messages
      render :new_deliveryaddresses and return
    end
    @user.build_streetaddress(@streetaddress.attributes)
    @user.deliveryaddresses.build(@deliveryaddresses.attributes)
    @user.save
    sign_in(:user, @user)
  end
  
  

  

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def streetaddress_params
    params.require(:streetaddress).permit(:postal_code, :prefecture_id, :city, :address, :building)
  end

  def deliveryaddresses_params
    params.require(:deliveryaddress).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :postal_code, :prefecture_id, :city, :address, :building, :phone_number)
  end  

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
