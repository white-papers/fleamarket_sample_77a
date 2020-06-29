class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :paymant_method ,              null: false
      t.references :deliveryaddress,          foreign_key: true
      t.references :credit_card,              foreign_key: true
      t.references :exhibitor,                foreign_key: {to_table: :users}
      t.references :buyer,                    foreign_key: {to_table: :users}
      t.timestamps
    end
  end
end
