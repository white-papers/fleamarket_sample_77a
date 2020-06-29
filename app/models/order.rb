class Order < ApplicationRecord
  has_one :delivery_address
  belongs_to :exhibitor, class_name: 'User',foreign_key:'exhibitor_id'
  belongs_to :buyer, class_name: 'User',foreign_key:'buyer_id'
  belongs_to :product

end
