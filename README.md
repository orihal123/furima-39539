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
has_many :order



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
has_one :order



## Addresses Table




|Column                |Type       |Options                       |
|------                |----       |-------                       |
|postal_code           |string     |null: false                   |
|prefecture_id         |integer    |null: false                   |
|municipalities        |string     |null: false                   |
|address_information   |string     |null: false                   |
|building_name         |string     |                              |
|telephone_number      |string     |null: false                   |
|order                 |references |null: false  foreign_key: true|

### Association
belongs_to :orders

## purchase records Table
|Column        |Type        |Options                         |
|------        |----        |-------                         |
|user          | references |null: false,  foreign_key: true |
|item          | references |null: false,  foreign_key: true |

### Association
has_one :address
belongs_to :item
belongs_to :user
