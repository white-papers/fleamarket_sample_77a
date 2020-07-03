class Deliveryaddress < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture, optional: true
  belongs_to :user, optional: true
  belongs_to :order, optional: true
  validates :family_name, :given_name, presence: { message: 'は全角で入力してください。' }, format: { with: VALID_NAME_REGEX}
  validates :family_name_kana, :given_name_kana, presence:  { message: 'は全角カタカナで入力してください。' }, format: { with:VALID_KANA_REGEX}
  validates :postal_code, presence: { message: '半角数字のみで入力してください。'}, format: { with: VALID_POSTAL_REGEX}
  validates :city, :address,:prefecture_id, presence: true
  validates :phone_number,format: { with:VALID_PHONE_REGEX, message: '半角数字のみで入力してください。'}, allow_blank: true
 

end
