# README

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|birth|integer|null: false|
|comment|text||
|icon|string||
|phone_number|integer|null: false, unique: true|
|mail|string|null: false|
|password|integer|null: false|
|good|string|null: false|
|normal|string|null: false|
|bad|string|null: false|

### Association

- has_many :payments
- has_many :comments
- has_many :likes
- has_many :items
- has_many :users, through: :users_historys
- has_many :users_historys
- has_one  :address

## addressテーブル

|Column|Type|Options|
|------|----|-------|
|postalcode|integer|null: false|
|prefectures|integer|null: false|
|city|string|null: false|
|building|string|null: false|
|house_number|string|null: false|
|user_id|integer|null: false, foreign_key true|

### Association
- belongs_to :user


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|description|text|null: false|
|status|integer|null: false|
|ship_fee|integer|null: false|
|ship|integer|null: false|
|ship_area|integer|null: false|
|date|integer|null: false|
|size|integer||
|user_id|integer|null: false, foreign_key: true|
|buyer_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: failse, foreign_key: true|

### Association

- has_many :comments
- has_many :images
- has_many :likes
- belongs_to :brand
- belongs_to :user
- belongs_to :category


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association

- has_many :items
- has_many :brands


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|url|string|null: false|

### Association

- belongs_to :item


## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|customer_id|string|null: false|
|card_id|string|null: false|

### Association

- belongs_to :user


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association

- has_many :items
- has_many :categorys


## likesテーブル

|Column|Type|Options|
|------|----|-------|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item


## historysテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|status|integer|null: false|

### Association
- has_many :users, through: :users_historys
- has_many :items


## users_historysテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|historys_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :history

