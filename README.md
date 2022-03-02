# テーブル設計
=============================================================================
## users ユーザ情報テーブル
| Column                   | Type          | Options                        |
| ------------------------ | ------------- | ------------------------------ |
| nickname                 | string        | null: false                    |
| email                    | string        | null: false, unique: true      |
| password                 | string        | null: false                    |
| last_name                | string        | null: false                    |
| first_name               | string        | null: false                    |
| last_name_kana           | string        | null: false                    |
| first_name-kana          | string        | null: false                    |
| birth_date               | date          | null: false                    |

## Association
--has_many :items
--has_many :comments_information
--belongs_to :shipping_information
--belongs_to :delivery_information
--belongs_to :card_information
=============================================================================
## items 商品情報テーブル
| Column                   | Type          | Options                        |
| ------------------------ | ------------- | ------------------------------ |
| item_image               |               | null: false                    |
| item_name                | string        | null: false                    |
| item-info                | text          | null: false                    |
| item-category            | string        | null: false                    |
| item_sales_status        | string        | null: false                    |
| item_shipping_fee_status | string        | null: false                    |
| item_prefecture          | string        | null: false                    |
| item_scheduled_deliver   | string        | null: false                    | 
| item_price               | integer       | null: false                    |
| add-tax-price            | integer       |                                |
| profit                   | integer       |                                |

## Association
--has_many :comments_information
--belongs_to :users
=============================================================================
## comments コメント情報テーブル
| Column                   | Type          | Options                        |
| ------------------------ | ------------- | ------------------------------ |
| comment                  | text          | null: false                    |

## Association
--belongs_to :users
--belongs_to :items
=============================================================================
## shipping 発送先情報テーブル
| Column                   | Type          | Options                        |
| ------------------------ | ------------- | ------------------------------ |
| postal_code              | string        | null: false                    |
| prefecture               | string        | null: false                    |
| city                     | string        | null: false                    |
| addresses                | string        | null: false                    |
| building                 | string        |                                |
| phone_number             | string        | null: false                    |

## Association
--belongs_to :users
=============================================================================
## delivery 配送先情報テーブル
| Column                   | Type          | Options                        |
| ------------------------ | ------------- | ------------------------------ |
| postal_code              | string        | null: false                    |
| prefecture               | string        | null: false                    |
| city                     | string        | null: false                    |
| addresses                | string        | null: false                    |
| building                 | string        |                                |
| phone_number             | string        | null: false                    |

## Association
--belongs_to :users
=============================================================================
## card カード情報テーブル
| Column                   | Type          | Options                        |
| ------------------------ | ------------- | ------------------------------ |
| card_number              | string        | null: false                    |
| card_exp_month           | string        | null: false                    |
| card-exp-year            | integer       | null: false                    |
| card-cvc                 | string        | null: false                    |

## Association
--belongs_to :users
=============================================================================