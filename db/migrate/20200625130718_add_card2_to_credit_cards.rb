class AddCard2ToCreditCards < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_cards, :card_id, :string
    add_column :credit_cards, :customer_id, :string
  end
end
