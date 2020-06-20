## usersテーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|encrypted_password|string|null: false|
|nickname|string|null: false|
|family_name|string|null: false|
|given_name|string|null: false|
|family_name_kana|string|null: false|
|given_name_kana|string|null: false|
|birthday|date|null: false|
### Association
- has_many :comments
- has_many :orders
- has_many :delivery_addresses
- has_many :products
- has_many :credit_cards
- has_one :street_address

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|size|numeric|null: false|
|status|string|null: false|
|product_name|string|null: false|
|estimated_delivery|datetime|null: false|
|shipping_fee_burden|string|null: false|
|prefectures|string|null: false|
|amount_of_money|integer|null: false|
|good_number|integer|
|product_details|text|null: false|
|shipping_method|string|null: false|
|exhibitor_id|integer|null: false, foreign_key: true|
|buyer_id|integer|foreign_key: true|
### Association
- belongs_to :exhibitor, class_name: 'User', :foreign_key :'exhibitor_id'
- belongs_to :buyer, class_name: 'User', :foreign_key :'buyer_id'
- belongs_to :order
- has_many :comments
^ has_many :image

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product|references|null: false, foreign_key: true|
|image|text|null: false|
### Association
- belongs_to :product

## categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|varchar(255)|null: false|
### Association
- has_many :products

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|
|user|references|null: false, foreign_key: true|
|product|references|null: false, foreign_key: true|
- belongs_to :user
- belongs_to :product


## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|unique:true|
|expiration_year|integer|null:false|
|expiration_month|integer|null:false|
|security_code|integer|null:false|
|user_name|string|null:false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user


## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|payment_method|string|null: false|
|delivery_method|references|null: false, foreign_key: true|
|delivery_address|references|null: false, foreign_key: true|
|exhibitor_id|references|null: false, foreign_key: true|
|buyer_id|references|null: false, foreign_key: true|
### Association
- has_one :delivery_address
- belongs_to :exhibitor, class_name: 'User', :foreign_key :'exhibitor_id'
- belongs_to :buyer, class_name: 'User', :foreign_key :'buyer_id'
- belongs_to :product

## delivery_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|given_name|string|null: false|
|family_name_kana|string|null: false|
|given_name_kana|string|null: false|
|postal_code|integer|null: false|
||prefecture_id(active_hash)|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|null: false|
|phone_number|integer|null: false|
|buyer_id|references|null: false, foreign_key: true|
### Association
- belongs_to :buyer, class_name: 'User', :foreign_key :'buyer_id'
- has_one :orders

## street_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefecture_id(active_hash)|integer|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to :user