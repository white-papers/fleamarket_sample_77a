class CreateCreditCards < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_cards do |t|
      t.string      :card,     null: false
      t.string      :customer, null: false
      t.references  :user,     foreign_key: true
      t.timestamps
    end
  end
end
