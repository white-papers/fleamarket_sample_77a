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
|selled_product|references|foreign_key: true:{ to_table: :products }|
|bought_product|references|foreign_key: true:{ to_table: :products }|

### Association
- has_many :comments
- has_many :orders
- has_many :delivery_addresses
- has_many :products
- has_one :street_address
- has_one :credit_card
- has_many :favorites

## productsテーブル
|Column|Type|Options|
|------|----|-------|
|size|numeric|null: false|
|status|string|null: false|
|name|string|null: false|
|estimated_delivery|string|null: false|
|shipping_fee_burden|string|null: false|
|prefectures|string|null: false|
|amount_of_money|integer|null: false|
|good_number|integer|
|product_details|text|null: false|
|shipping_method|string|null: false|
|exhibitor|references|foreign_key: { to_table: :users }|
|buyer|references|foreign_key: { to_table: :users }|
|category|references|null: false, foreign_key: true|
### Association
- belongs_to :exhibitor, class_name: 'User'
- belongs_to :buyer, class_name: 'User'
- belongs_to :order
- belongs_to :category
- has_many :comments
- has_many :image
- has_many :favorites

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|product|references|null: false, foreign_key: true|
|image|text|null: false|
### Association
- belongs_to :product

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|null: false|
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
|user|references|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|
### Association
- belongs_to :user


## ordersテーブル
|Column|Type|Options|
|------|----|-------|
|payment_method|string|null: false|
|product|references|null: false, foreign_key: true|
|delivery_method|references|null: false, foreign_key: true|
|delivery_address|references|null: false, foreign_key: true|
|exhibitor|references|null: false, foreign_key:{ to_table: :users}|
|buyer|references|null: false, foreign_key:{ to_table: :users }|
### Association
- has_one :delivery_address
- belongs_to :exhibitor, class_name: 'User'
- belongs_to :buyer, class_name: 'User'
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
|buyer|references|null: false, foreign_key:{ to_table:users }|
### Association
- belongs_to :buyer, class_name: 'User'
- belongs_to :order

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

## Favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false|
|product|references|null: false|
### Association
- belongs_to :user
- belongs_to :product