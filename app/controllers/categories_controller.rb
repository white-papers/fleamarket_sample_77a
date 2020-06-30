class CategoriesController < ApplicationController
before_action :set_category, only: [:show]

  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    @products = @category.set_products
    # .where(buyer_id: nil) を消すと購入済も表示
    @products = @products.where(buyer_id: nil).order("created_at DESC")
  end  

  private
  def set_category
    # カテゴリーidを元に,クリックされたカテゴリーのレコードを取得
    @category = Category.find(params[:id])

    # 一階層下のカテゴリーがある場合はそれを格納
    if @category.has_children?
      @category_links = @category.children
    # 無い場合は同じ階層のカテゴリーを格納
    else
      @category_links = @category.siblings
    end
  end

end
