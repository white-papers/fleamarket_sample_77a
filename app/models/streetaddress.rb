class Streetaddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture, optional: true

  belongs_to :user, optional: true
  validates :postal_code, presence: true, format: { with: VALID_POSTAL_REGEX }
  validates :city, :address,:prefecture_id, presence: true

  
end
