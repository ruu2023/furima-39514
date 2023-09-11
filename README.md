#テーブル設計

## usersテーブル

| Column   | Type   | Options      |
| -------- | ------ | ------------ |
| nickname | string | null:false   |
| email    | string | unique: true |
| password | string | null:false   |

### Association
has_many :items
has_many :records


## itemsテーブル

| Column      | Type      | Options          |
| ----------- | --------- | ---------------- |
| title       | text      | null:false       |
| description | text      | null:false       |
| category    | string    | null:false       |
| condition   | string    | null:false       |
| charge      | string    | null:false       |
| from        | string    | null:false       |
| days        | string    | null:false       |
| price       | string    | null:false       |
| user_id     | reference | foreign_key:true |

### Association
belongs_to :user
has_one :record


## recordsテーブル

| Column  | Type      | Options          |
| ------- | --------- | ---------------- |
| user_id | reference | foreign_key:true |
| item_id | reference | foreign_key:true |

### Association
belongs_to :user
belongs_to :item
has_one :address


## addressテーブル

| Column         | Type   | Options    |
| -------------- | ------ | ---------- |
| code           | string | null:false |
| prefecture     | string | null:false |
| municipalities | string | null:false |
| block          | string | null:false |
| apartment      | string |            |
| telephone      | string | null:false |

### Association
belongs_to :record