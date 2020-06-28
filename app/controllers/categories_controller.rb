class CategoriesController < ApplicationController
before_action :set_category, only: [:show, :child, :grandchild]

  def index
    @parents = Category.where(ancestry: nil)
  end

  def parent
    
  end

  def child
    
  end

  def grandchild
    
  end

  private
  def set_category
    # カテゴリーidを元に,クリックされたカテゴリーのレコードを取得
    @category = Category.find(params[:id])
  end

end
