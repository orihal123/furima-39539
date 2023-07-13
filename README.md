## users Table

|Column                      |Type      |Options           |
|------                      |----      |-------           |
|nickname                    |string    |null: false       |
|email                       |string    |null: false       |
|encrypted_password          |string    |null: false       |
|first_name                  |string    |null: false       |
|last_name                   |string    |null: false       |
|first_name_kana             |string    |null: false       |
|last_name_kana              |string    |null: false       |
|birthday                    |date      |null: false       |

### Association
has_many :items
has_many :purchase record



## items Table
|Column         |Type  |Options                         |
|------         |----  |-------                         |
|item_image     |string|null: false                     |
|item_name      |string|null: false                     |
|content        |string|null: false                     |
|category       |string|null: false                     |
|condition      |string|null: false                     |
|delivery_charge|string|null: false                     |
|area           |string|null: false                     |
|user_id        |string|null: false  foreign_key: true  |

### Association
belongs_to :items
has_one :purchase_record

## Shipping address Table

|Column             |Type  |Options           |
|------             |----  |-------           |
|post_code          |string|null: false       |
|prefectures        |string|null: false       |
|municipalities     |string|null: false       |
|address_information|string|null: false       |
|building_name      |string|null: false       |
|telephone_number   |string|null: false       |

### Association
belongs_to :purchase_record


## purchase records Table
|Column        |Type        |Options                         |
|------        |----        |-------                         |
|user_id       | references |null: false,  foreign_key: true |
|item_id       | references |null: false,  foreign_key: true |

### Association
has_one :Shipping address
belongs_to :user
belongs_to :items
