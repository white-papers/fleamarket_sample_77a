class AddProductsToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :size, :numeric
    add_column :products, :shipping_method, :string
  end
end
