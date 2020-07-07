class RemoveProductsFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :size, :numeric
    remove_column :products, :shipping_method, :string
  end
end
