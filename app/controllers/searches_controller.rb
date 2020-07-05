class SearchesController < ApplicationController
  before_action :set_ransack

  def index
    @products = Product.search(params[:search]).limit(132)
    @search = params[:search]
  end

  def detail_search
    @search_product = Product.ransack(params[:q]) 
    @products = @search_product.result.page(params[:page])
  end

  private

  def set_ransack
    @q = Product.ransack(params[:q])
  end

end
