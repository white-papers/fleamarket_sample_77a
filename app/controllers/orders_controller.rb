class OrdersController < ApplicationController
  
  # ↓↓商品出品機能が出来次第実装
  # require "payjp"

  # def new
  #   # 購入する商品を引っ張ってきます。
  #   @product = Product.find(params[:product_id])
  #   # 商品ごとに複数枚写真を登録できるので、一応全部持ってきておきます。
  #   @images = @product.images.all

  #   if user_signed_in?
  #     @user = current_user
  #     # クレジットカードが登録されているか確認
  #     if @user.credit_card.present?
  #       Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
  #       # ログインユーザーのクレジットカード情報を引っ張ってきます。
  #       @card = CreditCard.find_by(user_id: current_user.id)
  #       # ログインユーザーのクレジットカード情報からPay.jpに登録されているカスタマー情報を引き出す
  #       customer = Payjp::Customer.retrieve(@card.customer_id)
  #       # カスタマー情報からカードの情報を引き出す
  #       @customer_card = customer.cards.retrieve(@card.card_id)

  #       ##カードのアイコン表示のための定義づけ
  #       @card_brand = @customer_card.brand
  #       case @card_brand
  #       when "Visa"
  #         # (画像として登録されている)Visa.pngを返す
  #         @card_src = "visa.gif"
  #       when "JCB"
  #         @card_src = "jcb.gif"
  #       when "MasterCard"
  #         @card_src = "master.png"
  #       when "American Express"
  #         @card_src = "amex.gif"
  #       when "Diners Club"
  #         @card_src = "diners.gif"
  #       when "Discover"
  #         @card_src = "discover.gif"
  #       end
  
     
  #       @exp_month = @customer_card.exp_month.to_s
  #       @exp_year = @customer_card.exp_year.to_s.slice(2,3)
  #     else
  #     end
  #   else
  #     redirect_to user_session_path, alert: "ログインしてください"
  #   end
  # end

  # def pay
  #   @product = Product.find(params[:product_id])
  #   @images = @product.images.all

  #   # 購入テーブル登録ずみ商品は２重で購入されないようにする
  #   if @product.purchase.present?
  #     redirect_to product_path(@product.id), alert: "売り切れています。"
  #   else
  #     # 同時に2人が同時に購入し、二重で購入処理がされることを防ぐための記述
  #     @product.with_lock do
  #       if current_user.credit_card.present?
  #         # ログインユーザーがクレジットカード登録済みの場合の処理
  #         @card = CreditCard.find_by(user_id: current_user.id)
  #         Payjp.api_key = ENV["PAYJP_ACCESS_KEY"]
  #         #登録したカードでの、クレジットカード決済処理
  #         charge = Payjp::Charge.create(
  #         amount_of_money: @product.price,
  #         customer: Payjp::Customer.retrieve(@card.customer_id),
  #         currency: 'jpy'
  #         )
  #       else
  #         # ログインユーザーがクレジットカード登録されていない場合(Checkout機能による処理を行います)
  #         # APIの「Checkout」ライブラリによる決済処理の記述
  #         Payjp::Charge.create(
  #         amount_of_money: @product.price,
  #         card: params['payjp-token'], # フォームを送信すると作成・送信されてくるトークン
  #         currency: 'jpy'
  #         )
  #       end
  #     #購入テーブルに登録処理(今回の実装では言及しませんが一応、、、)
  #     @purchase = Purchase.create(buyer_id: current_user.id, product_id: params[:product_id])
  #     end
  #   end
  # end


end
