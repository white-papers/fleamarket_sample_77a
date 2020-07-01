class UsersController < ApplicationController
before_action :set_parents, only: [:show, :log_out]

  def index
    @card = CreditCard.where(user_id: current_user.id).first  
  end

  def show
    @card = CreditCard.where(user_id: current_user.id).first  
    @user = User.where(user_id: current_user.id)
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end
