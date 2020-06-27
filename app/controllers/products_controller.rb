class ProductsController < ApplicationController
  def index
    @parents = Category.where(ancestry: nil)
  end

  def new
    # @product = Product.new
    @parents = Category.where(ancestry: nil)
  end

  def show
    # @product = Product.find(params[:id])
  end

  def create
    @parents = Category.where(ancestry: nil)
    # @product = Product.new(product_params)
    # if @product.save
    #   render :index, notice: '出品が完了しました'
    # else
    #   render :new
    # end
  end

  def search
    respond_to do |format|
      format.html
      format.json do
        if params[:parent_id]
          #子カテゴリーを探して変数@childrenに代入
          @children = Category.find(params[:parent_id]).children
        elsif params[:children_id]
          @grandchildren = Category.find(params[:children_id]).children
        end
      end
    end

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
