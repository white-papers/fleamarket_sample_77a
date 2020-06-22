class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :streetaddress       
  has_many :deliveryaddresses
  
  
  validates :nickname, presence: true
  validates :email,presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :family_name, :given_name, presence: { message: 'は全角で入力してください。' }, format: { with: VALID_NAME_REGEX}
  validates :family_name_kana, :given_name_kana, presence:  { message: 'は全角カタカナで入力してください。' }, format: { with:VALID_KANA_REGEX}
  validates :birthday, presence: { message:'を入力してください。'}
end
