class RemoveUsersFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :surname, :string
    remove_column :users, :name, :string
    remove_column :users, :postal_code, :string
    remove_column :users, :prefectures, :string
    remove_column :users, :city, :string
    remove_column :users, :address, :string
    remove_column :users, :building, :string
  end
end
