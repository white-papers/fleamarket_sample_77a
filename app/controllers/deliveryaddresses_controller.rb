class DeliveryaddressesController < ApplicationController
  before_action :set_deliveryaddress
  def edit
    unless current_user
      redirect_to user_path(current_user)
    end  
  end

  def update
    if
      @deliveryaddress.update(deliveryaddresses_params)
      redirect_to deliveryaddress_user_path(current_user), alert: "届け先住所を変更しました"
    else  
      redirect_to edit_user_deliveryaddress(current_user), alert: "正しい値を入力してください"
    end
  end

  def set_deliveryaddress
    @deliveryaddress = Deliveryaddress.find_by(user_id: current_user.id)  
  end

  private
  def deliveryaddresses_params
    params.require(:deliveryaddress).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :postal_code, :city, :address, :building, :phone_number, :prefecture_id) 
  end  
end
