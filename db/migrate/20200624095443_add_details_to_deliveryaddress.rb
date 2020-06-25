class AddDetailsToDeliveryaddress < ActiveRecord::Migration[5.2]
  def change
    add_column :deliveryaddresses, :prefecture_id, :integer
  end
end
