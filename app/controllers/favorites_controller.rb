class FavoritesController < ApplicationController
  before_action :set_product, only: [:create, :destroy]

  def index
    @product_buyer = Product.where(buyer_id: current_user.id)
    @product_exhibitor = Product.where(exhibitor_id: current_user.id)
    @favorites = Favorite.where(user_id: current_user.id)
  end

  def create
    @favorite = Favorite.new(
      user_id: current_user.id, 
      product_id: @product.id
    )
    @favorite.save
  end

  def destroy
    @favorite = Favorite.find_by(
      user_id: current_user.id, 
      product_id: @product.id
    )
    @favorite.destroy
  end

  private
  def set_product
    @product = Product.find(params[:product_id])
  end

end
