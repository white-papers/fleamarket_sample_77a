class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :deliveryaddresses  
  validates :nickname, :family_name, :given_name, :family_name_kana, :given_name_kana, :birthday, presence: true
end
