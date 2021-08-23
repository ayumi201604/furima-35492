# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計


## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| fullname           | string | null: false |
| date_of_birth      | string | null: false |

### Association

-has_many :items_users
-has_many :items, through: :items_users
-has_many :comments

## items テーブル

| Column           | Type       | Options     |
| ------           | ------     | ----------- |
| image            |            |             |
| item_name        | string     | null: false |
| description      | text       | null: false |
| category         | string     | null: false |
| condition        | text       | null: false |
| shipping_costs   | string     | null: false |
| area             | string     | null: false |
| days             | string     | null: false |
| price            | string     | null: false |

### Association

-has_many :items_users
-has_many :items, through: :items_users
-has_many :comments

## comments テーブル

| Column             | Type       | Options     |
| ------------------ | ------     | ----------- |
| nickname           | string     | null: false |
| text               | text       | null: false |
| user               | references |             |
| item               | references |             |

### Association

-belongs_to :items
-belongs_to :user

## buys テーブル

| Column                 | Type       | Options     |
| ------                 | ------     | ----------- |
| credit_card_infomation | string     | null: false |
| date_of_expiry         | string     | null: false |
| security_code          | string     | null: false |
| postal_code            | string     | null: false |
| prefectures            | string     | null: false |
| municipalities         | string     | null: false |
| address                | string     | null: false |
| building_name          | string     | null: false |
| telephone_number       | string     | null: false |

### Association

-has_one :item
-belongs_to :user