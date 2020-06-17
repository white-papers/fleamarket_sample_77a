class CreateProfieladdresses < ActiveRecord::Migration[5.2]
  def change
    create_table :profieladdresses do |t|
      t.string     :postal_code
      t.string     :prefectures
      t.string     :city
      t.string     :address
      t.string     :building
      t.references :user,  foreign_key: true
      t.timestamps
    end
  end
end
