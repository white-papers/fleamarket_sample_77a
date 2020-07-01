class UsersController < ApplicationController
  def index
    @card = CreditCard.where(user_id: current_user.id).first  
  end

  def show
    @card = CreditCard.where(user_id: current_user.id).first  
    @user = User.where(user_id: current_user.id)
  end


  
end
