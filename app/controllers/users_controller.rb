class UsersController < ApplicationController
before_action :set_parents
before_action :set_credit_card, only: [:show]
before_action :set_user
  
  def show
    @product_buyer = Product.where(buyer_id: current_user.id)
    @product_exhibitor = Product.where(exhibitor_id: current_user.id)
  end

  def profile
    @streetaddress = Streetaddress.find_by(user_id: current_user.id)
  end  

  def log_out 
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(@user)
    end  
  end
  
  def update
    if 
      current_user.update(user_params)
      redirect_to profile_user_path(current_user), alert: "プロフィールを変更しました"
    else
      redirect_to edit_user_path(current_user), alert: "プロフィール変更に失敗しました"
    end
  end

  def set_user
    @user = User.where(user_id: current_user.id)  
  end
  def set_parents
    @parents = Category.where(ancestry: nil)
  end
  def set_credit_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

  private
  def user_params
    params.require(:user).permit(:email, :nickname, :family_name, :given_name, :family_name_kana, :given_name_kana, :birthday)
  end  

end
