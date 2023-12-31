FactoryBot.define do
  factory :order_address do
    postal_code             { '123-4567' }
    prefecture_id           { 2 }
    municipalities          { '板橋区' }
    address_information     { '1-1' }
    building_name           { '折原ハイツ' }
    telephone_number        { '00000000000' }
    token                   { 'tok_abcdefghijk00000000000000000' }
  end
end
