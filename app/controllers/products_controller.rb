class ProductsController < ApplicationController

  # before_action :set_products, only: [:edit, :show]
  
  def index
    @products = Product.includes(:images).order('created_at DESC')
    @parents = Category.where(ancestry: nil)
  end

  def new
    # @parents = Category.where(ancestry: nil)
    @product = Product.new
    @product.images.new
  end

  def edit
    # before_action
  end

  def destroy
  end

  def show
    # before_action
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      # render :index, notice: '出品が完了しました'
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

  #   def set_product
  #     @product = Product.find(params[:id])
  # end


end
