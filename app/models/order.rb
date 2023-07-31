class Order < ApplicationRecord
<<<<<<< Updated upstream
  has_one :address
  belongs_to :item
  belongs_to :user
end
=======
  belongs_to :item
  belongs_to :user
end
>>>>>>> Stashed changes
