class CreateStreetaddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :streetaddresses do |t|
      t.string      :postal_code,       null: false
      t.string      :city,              null: false
      t.string      :address,           null: false
      t.string      :building
      t.integer     :prefecture_id
      t.references  :user,              foreign_key: true
      t.timestamps
    end
  end
end
