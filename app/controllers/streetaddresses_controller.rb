class StreetaddressesController < ApplicationController
  before_action :set_streetaddress
  def edit
    unless current_user
      redirect_to user_path(current_user)
    end  
  end

  def update
    if
      @streetaddress.update(streetaddress_params)
      redirect_to profile_user_path(current_user), alert: "住所を変更しました"
    else
      redirect_to edit_user_streetaddress_path(current_user), alert: "正しい値を入力して下さい"
    end  
  end
  
  def set_streetaddress
    @streetaddress = Streetaddress.find_by(user_id: current_user.id)
  end  

  private
  def streetaddress_params
    params.require(:streetaddress).permit(:postal_code, :city, :address, :building, :prefecture_id)
  end  
end
