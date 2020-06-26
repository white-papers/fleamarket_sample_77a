class RemoveCardFromCreditCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :credit_cards, :card, :string
    remove_column :credit_cards, :customer, :string
  end
end
