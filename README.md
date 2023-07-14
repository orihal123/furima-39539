## users Table

|Column             |Type      |Options                       |
|------             |----      |-------                       |
|nickname           |string    |null: false                   |
|email              |string    |unique: true  null: false     |
|encrypted_password |string    |null: false                   |
|first_name         |string    |null: false                   |
|last_name          |string    |null:false                    |
|first_name_kana    |string    |null: false                   |
|last_name_kana     |string    |null: false                   |
|birthday           |date      |null: false                   |

### Association
has_many :items
has_many :purchase_records



## items Table
|Column                    |Type       |Options                         |
|------                    |----       |-------                         |
|item_name                 |string     |null: false                     |
|content                   |text       |null: false                     |
|category_id               |references |null: false  foreign_key: true  |
|condition_id              |references |null: false  foreign_key: true  |
|shipping_fee_burden_id    |references |null: false  foreign_key: true  |
|prefecture_id             |references |null: false  foreign_key: true  |
|shipping_duration_id      |references |null: false  foreign_key: true  |
|price                     |integer    |null: false                     |
|user                      |string     |null: false  foreign_key: true  |

### Association
belongs_to :user
has_one :purchase_records


## Shipping addresses Table

|Column                |Type       |Options                       |
|------                |----       |-------                       |
|post_code_id          |references |null: false  foreign_key: true|
|prefecture_id         |references |null: false  foreign_key: true|
|municipalities        |string     |null: false                   |
|address_information   |string     |null: false                   |
|building_name         |string     |                              |
|telephone_number      |integer    |null: false                   |
|purchaser_record_id   |references |null: false  foreign_key: true|

### Association
belongs_to :purchase_records


## purchase record Table
|Column        |Type        |Options                         |
|------        |----        |-------                         |
|user          | references |null: false,  foreign_key: true |
|item          | references |null: false,  foreign_key: true |

### Association
has_one :shipping_address
belongs_to :items
belongs_to :user
