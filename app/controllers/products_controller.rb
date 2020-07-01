class ProductsController < ApplicationController
  def index
    @products = Product.includes(:images, :user).order('created_at DESC').all.page(params[:page]).per(4)
    @parents = Category.where(ancestry: nil)
  end

  def new
    @product = Product.new
    @product.images.build
  end

  def show
    @product = Product.find(params[:id])
   
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

 

  private
  def product_params
    params.require(:product).permit(
      :size,
      :status,
      :name,
      :estimated_delivery,
      :shipping_fee_burden,
      :prefectures,
      :amount_of_money,
      :good_number,
      :product_details,
      :shipping_method,
      images_attributes: [:image] 
    ).merge(exhibitor: current_user).merge(user_id: current_user.id)
  end

end
