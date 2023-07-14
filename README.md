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
has_many :purchase_record



## items Table
|Column                    |Type  |Options                         |
|------                    |----  |-------                         |
|item_name                 |string|null: false                     |
|content                   |string|null: false                     |
|category                  |string|null: false                     |
|condition                 |string|null: false                     |
|shipping_fee_burden       |string|null: false                     |
|shipping_origin           |string|null: false                     |
|shipping_duration         |string|null: false                     |
|price                     |string|null: false                     |
|user                      |string|null: false  foreign_key: true  |

### Association
belongs_to :user
has_one :purchase_record
has_many :item_images

## item images Table
|Column                    |Type  |Options                         |
|------                    |----  |-------                         |
|item_image                |string|null: false                     |

### Association
belongs_to :items




## Shipping addresses Table

|Column                |Type  |Options           |
|------                |----  |-------           |
|post-code             |string|null: false       |
|prefectures           |string|null: false       |
|municipalities        |string|null: false       |
|address_information   |string|null: false       |
|building_name         |string|null: false       |
|telephone_number      |string|null: false       |
|purchase record_id   |string|null: false  foreign_key: true       |

### Association
belongs_to :purchase_record


## purchase record Table
|Column        |Type        |Options                         |
|------        |----        |-------                         |
|user          | references |null: false,  foreign_key: true |
|item          | references |null: false,  foreign_key: true |

### Association
has_one :Shipping_address
belongs_to :items
belongs_to :user
