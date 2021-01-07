# テーブル設計

## users テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| email      | string | null: false |
| password   | string | null: false |
| name       | string | null: false |
| profile    | text   | null: false |
| occupation | text   | null: false |
| position   | text   | null: false |

### Association

- has_many :prototypes
- has_many :comments

## prototype テーブル

| Column      | Type          | Options     |
| ----------- | ------------- | ----------- |
| title       | string        | null: false |
| catch_copy  | text          | null: false |
| concept     | text          | null: false |
| user        | reference     | null: false |

### Association

- belong_to :user
- has_many  :comments

## comments テーブル

| Column      | Type       | Options     |
| ----------- | ---------- | ----------- |
| text        | text       | null: false |
| user        | references | null: false |
| prototype   | references | null: false |

### Association

- belong_to :user
- belong_to :prototype
