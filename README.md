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


## users テーブル

| Column                 | Type    |  Options    |
| --------               | ------  | ----------- |
| name                   | string  | null: false |
| email                  | string  | null: false, unique: true |
| encrypted_password     | string  | null: false |
| sauna_history_id       | integer | null: false |

### Association

- has_many :totonous
- has_many :sauna_records
- has_many :comments

## totonous テーブル

| Column                            | Type       | Options     |
| --------                          | ------     | ----------- |
| sauna_temperature                 | float      | null: false |
| sauna_time                        | float      | null: false |
| status_id                         | float      | null: false |
| water_bath_temperature            | float      | null: false |
| water_bath_time                   | float      | null: false |
| shipping_date_id                  | float      | null: false |
| outside_air_bath_time             | float      | null: false |
| user                              | references | null: false, foreign_key: true|


### Association

- belongs_to :user


## sauna_records テーブル

| Column        | Type       | Options                        |
| ------        | ---------- | ------------------------------ |
| day           | date       | null: false                    |
| place         | string     | null: false                    |
| user          | references | null: false, foreign_key: true |


### Association

- belongs_to :user


## comments テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| memo   | text       | null: false |
| user   | references | null: false, foreign_key: true |

### Association

- belongs_to :user

