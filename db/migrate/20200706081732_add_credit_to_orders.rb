class AddCreditToOrders < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :credit_card, foreign_key: {on_delete: :nullify}
  
  end
end
