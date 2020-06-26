class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one  :credit_card
  has_one  :streetaddress       
  has_many :deliveryaddresses
  has_many :comments
  has_many :exhibitor_orders, class_name: 'order', foreign_key: 'exhibitor_id'
  has_many :buyer_orders, class_name: 'order',foreign_key:'buyer_id'

  


  validates :nickname, presence: true
  validates :email,presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :family_name, :given_name, presence: { message: 'は全角で入力してください。' }, format: { with: VALID_NAME_REGEX}
  validates :family_name_kana, :given_name_kana, presence:  { message: 'は全角カタカナで入力してください。' }, format: { with:VALID_KANA_REGEX}
  validates :birthday, presence: { message:'を入力してください。'}
end
