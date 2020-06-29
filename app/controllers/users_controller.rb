class UsersController < ApplicationController
before_action :set_parents

  def index
  end

  def show
    @user = User.where(user_id: current_user.id)
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

end
