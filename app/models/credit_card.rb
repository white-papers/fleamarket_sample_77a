class CreditCard < ApplicationRecord
  has_one :order
  belongs_to :user
  validates :user_id, :customer_id, :card_id, presence: true, uniqueness: true
end
