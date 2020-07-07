class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.numeric        :size,     	          null: false
      t.string         :status,               null: false
      t.string         :name,                 null: false
      t.string         :estimated_delivery,  	null: false
      t.string         :shipping_fee_burden,  null: false
      t.string         :prefectures,          null: false
      t.integer        :amount_of_money,      null: false
      t.integer        :good_number
      t.text           :product_details,      null: false
      t.string         :shipping_method,      null: false
      t.references     :user,                 null:false,foreign_key: true
      t.references     :exhibitor,            foreign_key: { to_table: :users }  
      t.references     :buyer,                foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
