# テーブル設計

## usersテーブル

| Column       | Type   | Options                  |
| ------------ | ------ | ------------------------ |
| nickname     | string | null:false               |
| email        | string | null:false, unique: true |
| password     | string | null:false               |
| surname      | string | null:false               |
| name         | string | null:false               |
| surname_kana | string | null:false               |
| name_kana    | string | null:false               |
| birthday     | date   | null:false               |

### Association
has_many :items
has_many :records


## itemsテーブル

| Column       | Type       | Options                      |
| ------------ | ---------- | ---------------------------- |
| title        | text       | null:false                   |
| description  | text       | null:false                   |
| category_id  | integer    | null:false                   |
| condition_id | integer    | null:false                   |
| charge_id    | integer    | null:false                   |
| from_id      | integer    | null:false                   |
| days_id      | integer    | null:false                   |
| price        | integer    | null:false                   |
| user         | references | null:false, foreign_key:true |

### Association
belongs_to :user
has_one :record


## recordsテーブル

| Column | Type       | Options                      |
| ------ | ---------- | ---------------------------- |
| user   | references | null:false, foreign_key:true |
| item   | references | null:false, foreign_key:true |

### Association
belongs_to :user
belongs_to :item
has_one :address


## addressesテーブル

| Column         | Type       | Options                      |
| -------------- | ---------- | ---------------------------- |
| post_code      | string     | null:false                   |
| prefecture     | string     | null:false                   |
| municipalities | string     | null:false                   |
| block          | string     | null:false                   |
| apartment      | string     |                              |
| telephone      | string     | null:false                   |
| record         | references | null:false, foreign_key:true |

### Association
belongs_to :record