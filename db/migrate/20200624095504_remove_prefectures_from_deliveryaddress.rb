class RemovePrefecturesFromDeliveryaddress < ActiveRecord::Migration[5.2]
  def change
    remove_column :deliveryaddresses, :prefectures, :string
  end
end
