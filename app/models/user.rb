class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :streetaddress       
  has_many :deliveryaddresses
  has_many :products
  has_many :exhibitor_products, class_name: 'Product', foreign_key: "exhibitor_id"
  has_many :buyer_products, class_name: 'Product', foreign_key: "buyer_id"
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Product"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "exhibitor_id", class_name: "Product"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "exhibitor_id", class_name: "Product"
  
  validates :nickname, presence: true
  validates :email,presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :family_name, :given_name, presence: { message: 'は全角で入力してください。' }, format: { with: VALID_NAME_REGEX}
  validates :family_name_kana, :given_name_kana, presence: { message: 'は全角カタカナで入力してください。' }, format: { with:VALID_KANA_REGEX}
  validates :birthday, presence: { message:'を入力してください。'}
end
