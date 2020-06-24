class CreateCardController < ApplicationController

  require "payjp"

  def new
    card = Card.where(user_id: current_user.id)
    redirect_to action: "show" if card.exists?
  end

  def pay #payjpとCardのデータベース作成の作成。
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    # クレジット登録の値の条件分岐
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      email: current_user.email, 
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      )
      @card = Create_card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end  
end

