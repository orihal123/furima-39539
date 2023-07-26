FactoryBot.define do
  factory :item do
    item_name                {'test'}
    content                  {'test@example'}
    price                    { rand(300..9999999) }
    
    association :user
    
  end
end
