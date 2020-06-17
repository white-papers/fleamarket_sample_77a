class CreateDeliveryaddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :deliveryaddresses do |t|
      t.string      :family_name,       null: false
      t.string      :given_name,        null: false
      t.string      :family_name_kana,  null: false
      t.string      :given_name_kana,   null: false
      t.string      :postal_code,       null: false
      t.string      :prefectures,       null: false
      t.string      :city,              null: false
      t.string      :address,           null: false
      t.string      :building
      t.string      :phone_number
      t.references  :user,             foreign_key: true
      
      t.timestamps
    end
  end
end
