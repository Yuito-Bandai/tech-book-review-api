## ログイン方法(動作確認)
以下の人でログイン
  { username: "alice", email: "alice@example.com", password: "password1234" },
  { username: "bob", email: "bob@example.com", password: "password1235" },
  { username: "charlie", email: "charlie@example.com", password: "password1236" }
### 初期データ
rails db:seed

rails import:books　　（データのインポート用（書籍APIの代わり））（kagguleからデータセットを借りました。）(タイトル：amazon Data Science Books Dataset)
### サーバーの立ち上げ
rails s
### 現状の画面
![image](https://github.com/user-attachments/assets/b0cdfbb9-b559-4da9-9c57-7e36ca78ad0b)
![image](https://github.com/user-attachments/assets/bb6c354a-b3e6-4388-9948-f0520b3de085)
![image](https://github.com/user-attachments/assets/ca1818fd-9935-45d2-a2bf-99e5c38dda9b)
![image](https://github.com/user-attachments/assets/ab167b6f-0ee3-4009-a40a-1bc6e6d90176)
![image](https://github.com/user-attachments/assets/5322b046-978e-4237-a984-4707365f2c50)
![image](https://github.com/user-attachments/assets/949e71ed-cfbd-48e6-b344-c3ebffe364ce)
![image](https://github.com/user-attachments/assets/9769844d-0a6d-4b5c-a692-f5f60447c916)


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
