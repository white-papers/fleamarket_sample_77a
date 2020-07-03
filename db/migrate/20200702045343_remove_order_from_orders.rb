class RemoveOrderFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :paymant_method, :string
  end
end
