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
--has_many :shipping
--has_many :purchasers
=============================================================================
## items 商品情報テーブル
| Column                      | Type          | Options                        |
| --------------------------- | ------------- | ------------------------------ |
| name                        | string        | null: false                    |
| info                        | text          | null: false                    |
| category_id                 | integer       | null: false                    |
| sales_status_id             | integer       | null: false                    |
| shipping_fee_status_id      | integer       | null: false                    |
| prefecture_id               | integer       | null: false                    |
| scheduled_deliver_id        | integer       | null: false                    | 
| price                       | integer       | null: false                    |
| user                        | references    | null: false, foreign_key: true |

## Association
--belongs_to :user
--has_one :purchaser
=============================================================================
## shippings 発送先情報テーブル
| Column                   | Type          | Options                        |
| ------------------------ | ------------- | ------------------------------ |
| postal_code              | string        | null: false                    |
| prefecture_id            | integer       | null: false                    |
| city                     | string        | null: false                    |
| addresses                | string        | null: false                    |
| building                 | string        |                                |
| phone_number             | string        | null: false                    |
| purchaser                | references    | null: false, foreign_key: true |

## Association
--belongs_to :purchaser
=============================================================================
## purchasers 購入履歴テーブル
| Column                   | Type          | Options                        |
| ------------------------ | ------------- | ------------------------------ |
| user                     | references    | null: false, foreign_key: true |
| item                     | references    | null: false, foreign_key: true |

## Association
--belongs_to :user
--belongs_to :item
--has_one :shipping