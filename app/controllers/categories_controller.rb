class CategoriesController < ApplicationController
before_action :set_category, only: [:show]

  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    @products = @category.set_products
    @products = @products.where(buyer_id: nil).order("created_at DESC")
  end  

  private
  def set_category
    # カテゴリーidを元に,クリックされたカテゴリーのレコードを取得
    @category = Category.find(params[:id])
  end

end
