class ProductsController < ApplicationController
  def index
  end

  def new
    # @product = Product.new
  end

  def create
    # @product = Product.new(product_params)
    # if @product.save
    #   render :index, notice: '出品が完了しました'
    # else
    #   render :new
    # end
  end

  private
  def product_params
    # product.require(:product).permit(
    #     :product_name, 
    #     images_attributes: [:image], 
    #     :amount_of_money, 
    #     :product_details, 
    #     categorys_attributes: [:category], :brand, 
    #     :size, :status, 
    #     :shipping_fee_burden, :shippng_method, 
    #     :prefectures, :estimated_delivery).merge(user_id: current_user.id)
  end

end
