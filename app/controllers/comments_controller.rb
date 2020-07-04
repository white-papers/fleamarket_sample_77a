class CommentsController < ApplicationController

  before_action :set_comment, only: [:update,:destroy,:restore]
  before_action :check_user, only: [:update,:destroy,:restore]

  def create
    @comment = Comment.new(comment_params)
    @exhibitor_of_product = @comment.product.exhibitor
    if @comment.save
      redirect_to product_path(@comment.product.id)
    else
      redirect_to product_path(@comment.product.id), alert: "コメントに失敗しました。"
    end
  end

  def update
    @comment.update(delete_check:1)
    redirect_to product_path(@comment.product.id)
  end

  def restore
    @comment.update(delete_check:0)
    redirect_to product_path(@comment.product.id)
  end

  def destroy
    @comment.destroy
    redirect_to product_path(@comment.product.id)
  end

private
  def comment_params
    params.require(:comment).permit(:comment,:product_id).merge(user_id: current_user.id)
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def check_user
    unless @comment.product.exhibitor == current_user
      flash[:alert] = "その操作はできません"
      redirect_to root_path
    end
  end

end
