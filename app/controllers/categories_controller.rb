class CategoriesController < ApplicationController
before_action :set_category, only: [:show]

  def index
    @parents = Category.where(ancestry: nil)
  end

  def show
    # .orderの前に .where(buyer_id: nil) を追加すると購入済非表示
    @products = @category.set_products.order("created_at DESC").all.page(params[:page]).per(4)
  end  

  private
  def set_category
    # カテゴリーidを元に,クリックされたカテゴリーのレコードを取得
    @category = Category.find(params[:id])

    # ↓詳細カテゴリページのリンク用
    # 一階層下のカテゴリーがある場合はそれを格納
    if @category.has_children?
      @category_links = @category.children
    # 無い場合は同じ階層のカテゴリーを格納
    else
      @category_links = @category.siblings
    end
  end

end
