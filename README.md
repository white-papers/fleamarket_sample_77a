## userテーブル
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
|street_address|references|foreign_key: true|
|credit_cards|references|foreign_key: true|
|delivery_address|references|foreign_key: true|

### Association
- has_many :comments
- has_many :orders
- has_many :delivery_address
- has_many :product
- has_many :credit_card
- has_one :street_address

## Productテーブル
|Column|Type|Options|
|------|----|-------|
|category|string|null: false|
|brand|string|null: false|
|size|numeric|null: false|
|status|string|null: false|
|product_name|string|null: false|
|estimated_delivery|datetime|null: false|
|shipping_fee_burden|string|null: false|
|prefectures|string|null: false|
|amount_of_money|integer|null: false|
|good_number|integer|
|product_details|text|null: false|
|image|text|null: false|
|shipping_method|string|null: false|
|exhibitor_user|references|foreign_key: true|
|buyer_user|references|foreign_key: true|

### Association
- belongs_to :exhibitor.user
- belongs_to :buyer.user
- belongs_to :orders
- has_many :comments

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|
|user|integer|foreign_key: true|
|product|integer|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :product

## street_addressテーブル
|Column|Type|Options|
|------|----|-------|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|null: false|
|user|references|foreign_key: true|


### Association
- has_one : user

## credit_cardテーブル
|Column|Type|Options|
|------|----|-------|
|card_number|integer|unique:true|
|expiration_year|integer|null:false|
|expiration_month|integer|null:false|
|security_code|integer|null:false|
|user_name|string|null:false|
|user|integer|foreign_key:true|

### Association
- belongs_to :user


## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|delivery_method|references|foreign_key: true|
|payment_method|references|foreign_key: true|
|delivery_address|references|foreign_key: true|
|exhibitor_user|references|foreign_key: true|
|buyer_user|references|foreign_key: true|


### Association
- has_one :delivery_address
- belongs_to :exhibitor.user
- belongs_to :buyer.user
- belongs_to :product

## delivery_addressテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|given_name|string|null: false|
|family_name_kana|string|null: false|
|given_name_kana|string|null: false|
|postal_code|integer|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|string|null: false|
|building|string|null: false|
|phone_number|integer|null: false|
|buyer_user|references|foreign_key: true|

### Association
- belongs_to :buyer_user
- has_one :orders