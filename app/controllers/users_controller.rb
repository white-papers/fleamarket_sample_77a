class UsersController < ApplicationController
before_action :set_parents, only: [:show, :log_out]
before_action :set_credit_card, only: [:show]
 
  def show
    @user = User.where(user_id: current_user.id)
    @product_buyer = Product.where(buyer_id: current_user.id)
    @product_exhibitor = Product.where(exhibitor_id: current_user.id)
  end

  def log_out 
    @user = User.where(user_id: current_user.id)
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end
  def set_credit_card
    @card = CreditCard.find_by(user_id: current_user.id)
  end

end
