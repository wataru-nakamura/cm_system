# Customer Management System
このアプリケーションは顧客管理を目的としたアプリです。
氏名・住所・年齢などの情報や個人ごとにメモを残したりすることができます。

### 機能一覧
管理ユーザー登録機能/管理ユーザーログイン機能/顧客登録機能/顧客詳細表示機能/顧客編集機能/顧客検索機能/メモ投稿機能/地図表示機能/単体テスト機能

## 本番環境
URL:&emsp;https://cm-system.herokuapp.com/<br>email:&emsp;test@gmail.com<br>pass:&emsp;test11

## DEMO
##### 顧客検索とメモ機能
![検索機能](https://user-images.githubusercontent.com/68258033/93861628-c88e9600-fcfb-11ea-9495-b395c9a86824.gif)
![メモ機能](https://user-images.githubusercontent.com/68258033/93861853-26bb7900-fcfc-11ea-89a4-0204fb903777.gif)


## 制作背景
このアプリは私が前職で営業をやっていた時に感じた不便さを解消してみたいという思いから作成しました。
できるだけシンプルにわかりやすく設計しつつ、必要な機能はきちんと盛り込んである。そんなアプリを目指しました。
## 使用技術
Ruby
Ruby on Rails
javascript
Github
MySQL

## 工夫したポイント
使い方が直感でわかるようシンプルな設計に、それでいて痒いところには手が届く機能を盛り込みました。

## 今後実装したい機能
今は地図を検索フォームに入れて入力することで表示させているが、DBの登録住所から表示できるように仕様変更する。

## DB設計

### users テーブル

| Column      | Type   | Options     |
| ----------- | ------ | ----------- |
| name        | string | null: false |
| email       | string | null: false |
| password    | string | null: false |

#### Association

- has_many :cusotmers
- has_one  :comments

### customers テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birthday         | date   | null: false |
| gender           | string | null: false |
| age              | string | null: false |
| postal_code      | string | null: false |
| address          | string | null: false |
| building_name    | string |             |
| phone_number     | string | null: false |
| e-mail           | string |             |


#### Association

- belongs_to :user
- has_many   :comments

### comments テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| content      | string     | null: false                    |
| customer_id  | references | null: false, foreign_key: true |
| user_id      | references | null: false, foreign_key: true |

#### Association

- belongs_to :customer
- belongs_to :user
