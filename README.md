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

| Column                    | Type   | Options                        |
| ------------------        | ------ | -----------                    |
| nickname                  | string | null: false                    |
| email                     | string | null: false, foreign_key: true |
| encrypted_password        | string | null: false                    |
| first_name                | string | null: false                    |
| last_name                 | string | null: false                    |
| first_name_kana           | string | null: false                    |
| last_name_kana            | string | null: false                    |
| birth_day                 | date   | null: false                    |

### Association

-has_many :users, through: :items_users

## item_users テーブル

| Column    | Type       | Options                        |
| ------    | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

-belongs_to :room
-belongs_to :user
-has_one :buys

## items テーブル

| Column            | Type       | Options                        |
| ------            | ------     | -----------                    |
| item_name         | string     | null: false                    |
| description       | text       | null: false                    |
| category_id       | integer    | null: false                    |
| condition_id      | integer    | null: false                    |
| shipping_costs_id | integer    | null: false  foreign_key: true |
| area_id           | integer    | null: false                    |
| days_id           | integer    | null: false,                   |
| price             | integer    | null: false,                   |

### Association

-has_many :items_users
-has_many :items, through: :items_users

## buys テーブル

| Column                 | Type       | Options                         |
| ------                 | ------     | -----------                     |
| postal_code            | string     | null: false                     |
| area_id                | integer    | null: false                     |
| municipalities         | string     | null: false, foreign_key: true  |
| address                | string     | null: false, foreign_key: true  |
| building_name          | string     | foreign_key: true               |
| telephone_number       | string     | null: false, foreign_key: true  |
| user_id                | references | null: false, foreign_key: true  |
| item_id                | references | null: false, foreign_key: true  |
### Association

-belongs_to :item_users