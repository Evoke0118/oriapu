# README

## アプリケーション概要
サウナでのととのう体験をサポートするアプリ。
前提として、ととのう体験をするためには、【サウナ→水風呂→外気浴】の肯定が必要であり、それぞれ適切な温度や時間で入らなければ実現できないもの。
サウナ初心者の方はそれらの適切な条件がわからず、ととのう体験を出来ないまま「サウナ＝ただ暑いだけ」「水風呂＝冷たくて嫌」などの悪い印象を持ってしまう人が多い。
ユーザーそれぞれのサウナ体験をすべてデータ化し、ととのう体験を実現するためにその人に足りない条件を教えてくれる。

## 開発背景
サウナでのととうのう体験は、脳疲労が取れる、頭が良くなる、アイデアが湧きやすくなる、メンタルが安定する、睡眠の質向上、美肌効果、痩せやすくなるなど沢山のメリットがある。サウナでのととのう体験が普及することで現代のようなストレス社会で悩みを抱える人たちが減り、人生を充実する人が増えるはずである。私自身がそうであるようにサウナを通して前向きに生きていける人が増えて欲しいという思いの元、今回のアプリ制作に至った。


## 洗い出した要件 
|  機能  |  目的  |  詳細  |  ストーリー  |
| ---- | ---- | ---- | ---- |
|  ユーザー管理機能 |  登録されたユーザーのみ使えるようにするため  |  名前、email、パスワード、サウナ歴を登録させる  |  新規登録の際、サウナ歴がどれくらいかを選択させる  |
|  サウナ温度・時間入力機能  |  サウナの温度と時間を確認することで、ととのうことが出来るか判断  |  体調と体温を入力させる  |  体調は選択肢の中から選ぶ(良好・普通・不調)　体調が不調、体温が37℃以上の時に引っかかる  |
|  水風呂温度・時間入力機能  |  水風呂の温度と時間を確認することで、ととのうことが出来るか判断  |  水風呂の温度と時間を入力させる  |  ・温度が10度以下、20度以上の時に引っかかる（＝10〜20度が◎）<br>・時間が30秒未満、2分以上の時に引っかかる（＝30秒〜2分が◎）  |
|  外気浴時間入力機能  |  外気浴の時間を確認することで、ととのうことが出来るか判断  |  外気浴の時間を入力させる  |  時間が0秒〜30秒の時に引っかかる  |
|  サウナ記録入力機能  |  毎日のサウナ記録を保存するため  |  サウナの日付・場所を入力する  | サウナに行った日にちや場所の記録を残すことでモチベーションに繋がる　|
|  サウナ記録検索機能  |  サウナ記録を検索するため  | ユーザー・日付・場所ごとの検索ができる　 |  サウナに行った日にちを検索することで、記録を振り返ることが出来る  |
|  コメント機能  |  サウナ記録情報にコメントをするため |  最新のサウナ記録に対してのコメントを残せるようにする  |  サウナ記録に対してコメントをすることができる。<br>ととのう体験ができない人は他の方からアドバイスをもらうことができるメリット。  |



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

