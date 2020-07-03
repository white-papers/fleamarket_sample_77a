class Order < ApplicationRecord
  has_one :deliveryaddress
  belongs_to :exhibitor, class_name: 'User',foreign_key:'exhibitor_id', optional: true
  belongs_to :buyer, class_name: 'User',foreign_key:'buyer_id', optional: true
  belongs_to :product, optional: true
  belongs_to :credit_card, optional: true

end
