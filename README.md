# README


# **実装機能紹介**
---



## フリーマーケットのアプリケーションを作成しました。

### shibatasuguru0311の担当箇所
---

### 役職：スクラムマスター  


### 商品出品機能


・複数の画像を同時に投稿することができる  
・別のテーブル同士を紐付けてデータに保存することができる  
・ j Query、HTML、SCSSを使用してのマークアップ  
・バリデーション、テストの記述  


### 出品商品の編集、削除機能

・商品情報を編集や削除することができる  
・単体テストやエラーハンドリングの記述  
・HTML、SCSSを使用したマークアップ  

### 商品一覧機能
<img width="1303" alt="e54ad7e697d1eddf6eec859fc990740d" src="https://user-images.githubusercontent.com/67133171/90210709-aca8f200-de29-11ea-84e2-c06859a8b3b4.png">

・新着順にトップページ、詳細ページに表示される  
・売り切れた商品はSOLDOUTの表示となる  


### マークアップ
・マイページ、カテゴリーページを除く全てのページのマークアップを実施  
![1811fc0945a943a937ff64c312dab95f](https://user-images.githubusercontent.com/67133171/90210495-0e1c9100-de29-11ea-9949-057a937f2874.jpg)
![224959705d2c4096d48e933d0916e0a1](https://user-images.githubusercontent.com/67133171/90210472-02c96580-de29-11ea-8667-d05c1fc35b08.jpg)



## 開発状況
---


- 開発環境
    * 開発言語：
        * Ruby/Ruby on Rails
    * 開発ツール：
        * Gthub/AWS/Visual Studio Code
    * データベース：
        * MySQL
- 開発期間
    * 開発期間：
        * 28日間(7/21 ~ 8/14 )
    * 平均作業時間：
        * 9時間/1日
- 開発体制
    * 人数：
        * 3人
    * 開発方式：
        * アジャイル型開発（スクラム）
    * タスク管理：
        * Trelloによるタスク管理
- 動作概要
    * 接続先情報
    * URL：
        * http://54.95.64.121/
    * ID:
        * admin
    * Pass:
        * 2222
        
       
## ER図
---
![88249235-cf3e6400-ccde-11ea-9152-b8ff57c16a29](https://user-images.githubusercontent.com/67133171/90210446-f218ef80-de28-11ea-8666-b016d7461b34.png)
<img width="1303" alt="e54ad7e697d1eddf6eec859fc990740d" src="https://user-images.githubusercontent.com/67133171/90210460-f9d89400-de28-11ea-89b0-3b4d1d8299b8.png">





# 最終課題 DB設計

## Userテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|
|family_name|string|null: false|
|first_name|string|null: false|
|family_name_kana|string|null: false|
|first_name_kana|string|null: false|
|birthday_year|integer|null: false|
|birthday_month|integer|null: false|
|birthday_day|integer|null: false|
|user_image|string||
|introduction|text||

### Association

- has_many :items
- has_one :card
- has_one :address

## Cardテーブル

使用gem

- pay.jp

|Column|Type|Options|
|------|----|-------|
|customer_token|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user

## Addressテーブル

|Column|Type|Options|
|------|----|-------|
|post_code|integer|null: false|
|prefecture_id (active_hash)|string|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|string||
|user_id|references|null: false, foreign_key: true|

### Association

- belongs_to :user

## Itemテーブル

以下のカラムはenumを使用
- prefecture
- condittion
- postage_user
- preparation

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|introduction|text|null: false|
|category_id|references|null: false, foreign_key: true|
|brand|string||
|condition|integer|null: false, default: 0|
|postage_user|integer|null: false, default: 0||
|prefecture_id (active_hash)|string|null: false|
|preparation|integer|null: false, default: 0||
|price|integer|null: false|
|seller_id|references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|
|closed_at|datetime||

### Association

- has_many :images
- belongs_to :category
- belongs_to :user


## Imageテーブル

|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association

- belongs_to :item

## Categoryテーブル

使用gem

- ancestry

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|integer|null :false|

### Association

- has_many :items
