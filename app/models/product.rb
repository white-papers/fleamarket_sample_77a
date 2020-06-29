class Product < ApplicationRecord
  belongs_to :user
  belongs_to :exhibitor, class_name: 'User'
  # ↓商品購入機能実装時に以下の行の記述のコメントアウトを外します。
  # belongs_to :buyer, class_name: 'User'
  has_many :comments 
  has_many :images
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :buyer_id, presence: true, allow_blank: true
  validates :size, :status, :name, :estimated_delivery, :shipping_fee_burden, :prefectures, :amount_of_money, :product_details, :shipping_method, presence: true
end
