# テーブル設計
=============================================================================
## users ユーザ情報テーブル
| Column                   | Type          | Options                        |
| ------------------------ | ------------- | ------------------------------ |
| nickname                 | string        | null: false                    |
| email                    | string        | null: false, unique: true      |
| encrypted_password       | string        | null: false                    |
| last_name                | string        | null: false                    |
| first_name               | string        | null: false                    |
| last_name_kana           | string        | null: false                    |
| first_name_kana          | string        | null: false                    |
| birth_date               | date          | null: false                    |

## Association
--has_many :items
--has_many :shipping
--has_many :purchasers
=============================================================================
## items 商品情報テーブル
| Column                      | Type          | Options                        |
| --------------------------- | ------------- | ------------------------------ |
| item_name                   | string        | null: false                    |
| item_info                   | text          | null: false                    |
| item-category_id            | integer       | null: false                    |
| item_sales_status_id        | integer       | null: false                    |
| item_shipping_fee_status_id | integer       | null: false                    |
| item_prefecture_id          | integer       | null: false                    |
| item_scheduled_deliver_id   | integer       | null: false                    | 
| item_price                  | integer       | null: false                    |

## Association
--belongs_to :users
--belongs_to :shipping
--belongs_to :purchasers
=============================================================================
## shipping 発送先情報テーブル
| Column                   | Type          | Options                        |
| ------------------------ | ------------- | ------------------------------ |
| postal_code              | string        | null: false                    |
| prefecture_id            | integer       | null: false                    |
| city                     | string        | null: false                    |
| addresses                | string        | null: false                    |
| building                 | string        |                                |
| phone_number             | string        | null: false                    |

## Association
--belongs_to :users
--belongs_to :items
=============================================================================
## purchaser 購入履歴テーブル
| Column                   | Type          | Options                        |
| ------------------------ | ------------- | ------------------------------ |
| nickname_id              | references    | null: false, foreign_key: true |
| prefecture_id            | references    | null: false, foreign_key: true |

## Association
--belongs_to :users
--belongs_to :items