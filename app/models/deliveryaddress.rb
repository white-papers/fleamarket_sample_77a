class Deliveryaddress < ApplicationRecord
  belongs_to :user, optional: true
  validates :family_name, :given_name, :family_name_kana, :given_name_kana, :postal_code, :prefectures, :city, :address, presence: true
end
