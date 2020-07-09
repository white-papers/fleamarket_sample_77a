class ProductsController < ApplicationController

before_action :set_parents, only: [:index, :new, :create, :show, :edit]
before_action :set_product, only: [:show, :edit, :update, :destroy]
  
  def index
    @products = Product.includes(:user).order('created_at DESC').all.page(params[:page]).per(4)
    @parents = Category.where(ancestry: nil)

  end

  def new
    if user_signed_in?
      @product = Product.new
      @product.images.build
    else
      redirect_to user_session_path, alert: "ログインしてください"
    end
  end

  def show
    @images = @product.images
    @comment = Comment.new
    @commentALL = @product.comments
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path, notice: '出品が完了しました'
    else
      flash[:alert] = '未入力項目があります'
      render :new, notice: 'もう一度入力してください'
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
    if user_signed_in?
      unless @product.exhibitor_id == current_user.id && @product.buyer_id.blank?
        redirect_to root_path 
      end
    else
      redirect_to user_session_path, alert: "ログインしてください"
    end
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product), notice: '更新が完了しました'
    else
      render :edit, notice: 'もう一度入力してください'
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
      images_attributes: [:image, :_destroy, :id] 
    ).merge(exhibitor: current_user).merge(user_id: current_user.id)
  end
  
  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end

