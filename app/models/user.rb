class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

  has_one  :credit_card
  has_one  :streetaddress       
  has_many :deliveryaddresses

  has_many :comments, dependent: :destroy
  has_many :exhibitor_orders, class_name: 'order', foreign_key: 'exhibitor_id'
  has_many :buyer_orders, class_name: 'order',foreign_key:'buyer_id'
 
  has_many :products
  has_many :exhibitor_products, class_name: 'Product', foreign_key: "exhibitor_id"
  has_many :buyer_products, class_name: 'Product', foreign_key: "buyer_id"
  has_many :buyed_items, foreign_key: "buyer_id", class_name: "Product"
  has_many :saling_items, -> { where("buyer_id is NULL") }, foreign_key: "exhibitor_id", class_name: "Product"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "exhibitor_id", class_name: "Product"
  
  has_many :favorites, dependent: :destroy
  has_many :favorites, through: :favorites, source: :product

  has_many :sns_credentials
  
  validates :nickname, presence: true
  validates :email,presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :family_name, :given_name, presence: { message: 'は全角で入力してください。' }, format: { with: VALID_NAME_REGEX}
  validates :family_name_kana, :given_name_kana, presence: { message: 'は全角カタカナで入力してください。' }, format: { with:VALID_KANA_REGEX}
  validates :birthday, presence: { message:'を入力してください。'}

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = sns.user || User.where(email: auth.info.email).first_or_initialize(
      nickname: auth.info.name,
        email: auth.info.email
    )
    
    # userが登録済みの場合はそのままログインの処理へ行くので、ここでsnsのuser_idを更新しておく
    if user.persisted?
      sns.user = user
      sns.save
    end
    { user: user, sns: sns }
  end
end
