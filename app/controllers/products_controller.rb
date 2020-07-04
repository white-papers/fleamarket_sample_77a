class ProductsController < ApplicationController

before_action :set_parents, only: [:index, :new, :create, :show, :edit]
before_action :set_products, only: [:show, :destroy]
before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    @products = Product.includes(:user).order('created_at DESC').all.page(params[:page]).per(4)
    @parents = Category.where(ancestry: nil)

  end

  def new
    @product = Product.new
    @product.images.build
  end

  def edit
  end

  def destroy
  end

  def show
    @images = @product.images
    @comment = Comment.new
    @commentALL = @product.comments
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    if @product.user_id == current_user.id && @product.destroy
      redirect_to root_path
    else
      redirect_to product_path(@product.id)
    end  
  end

  def edit
    @product.images.build
  end

  def update
    @product.update(product_params)
    if @product.update(product_params)
      redirect_to root_path, notice: '更新されました'
    else
      render :edit
    end
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


  def set_products
    @product = Product.find(params[:id])
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
      :category_id,
      images_attributes: [:image] 
    ).merge(exhibitor: current_user).merge(user_id: current_user.id)
  end
  
  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end

