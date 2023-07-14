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
|Column                    |Type           |Options                         |
|------                    |----           |-------                         |
|item_name                 |string         |null: false                     |
|content                   |text           |null: false                     |
|category_id               |integer        |null: false                     |
|condition_id              |integer        |null: false                     |
|shipping_fee_burden_id    |integer        |null: false                     |
|prefecture_id             |integer        |null: false                     |
|shipping_duration_id      |integer        |null: false                     |
|price                     |integer        |null: false                     |
|user                      |references     |null: false  foreign_key: true  |

### Association
belongs_to :user
has_one :purchase_record


## Shipping addresses Table

|Column                |Type       |Options                       |
|------                |----       |-------                       |
|post_code_id          |string     |null: false                   |
|prefecture_id         |integer    |null: false                   |
|municipalities        |string     |null: false                   |
|address_information   |string     |null: false                   |
|building_name         |string     |                              |
|telephone_number      |string     |null: false                   |
|purchaser_record      |references |null: false  foreign_key: true|

### Association
belongs_to :purchase_record

## purchase records Table
|Column        |Type        |Options                         |
|------        |----        |-------                         |
|user          | references |null: false,  foreign_key: true |
|item          | references |null: false,  foreign_key: true |

### Association
has_one :shipping_address
belongs_to :item
belongs_to :user
