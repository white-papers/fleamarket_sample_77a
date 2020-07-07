class RemoveCreditFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_reference :orders, :credit_card, foreign_key: true
  end
end
