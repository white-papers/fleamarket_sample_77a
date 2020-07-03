class OrdersController < ApplicationController
  require "payjp"
  before_action :set_product
  before_action :set_credit_card
  before_action :set_deliveryaddress
  def show
    if user_signed_in?
      current_user
      @image = @product.images.all
      if @card.blank?
        redirect_to product_path(@product.id), alert: "クレジットカードを登録してください"
      else
        Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
        customer = Payjp::Customer.retrieve(@card.customer_id)
        @customer_card = customer.cards.retrieve(@card.card_id)
          ##カードのアイコン表示のための定義づけ
        @card_brand = @customer_card.brand
        case @card_brand
        when "Visa"
          @card_src = "visa.png"
        when "JCB"
          @card_src = "jcb.png"
        when "MasterCard"
          @card_src = "mastercard.png"
        when "American Express"
          @card_src = "americanExpress.png"
        when "Diners Club"
          @card_src = "dinersClub.png"
        when "Discover"
          @card_src = "discover.png"
        end
        @exp_month = @customer_card.exp_month.to_s
        @exp_year = @customer_card.exp_year.to_s.slice(2,3)
      end
    else
      redirect_to user_session_path, alert: "ログインしてください"
    end
  end

  def pay  
    Payjp.api_key = Rails.application.credentials.payjp[:secret_key]
    Payjp::Charge.create(
      amount: @product.amount_of_money,
      customer: @card.customer_id, #顧客ID
      currency: 'jpy' #日本円
    )
    redirect_to done_order_path(@product.id, @card.id, @deliveryaddress.id, ) #完了画面に移動
  end

  def done
    @product_buyer = Product.find(params[:id])
    @product_buyer.update(buyer_id: current_user.id)
    @image = @product.images.all
    order = Order.create(
      buyer_id: current_user.id, 
      exhibitor_id: @product.exhibitor_id,
      product_id: @product.id, 
      deliveryaddress_id: @deliveryaddress.id, 
      credit_card_id: @card.id
      )
  end 

  def set_product
    @product = Product.find(params[:id])
  end  
  def set_deliveryaddress
    @deliveryaddress =  Deliveryaddress.where(user_id: current_user.id).first
  end  
  def set_credit_card
    @card = CreditCard.find_by(user_id: current_user.id) 
  end  

end
