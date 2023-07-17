FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    first_name            { '折原'}
    last_name             { '圭介'}
    first_name_kana       { 'オリハラ'}
    last_name_kana        { 'ケイスケ'}
    birthday              { Faker::Date.birthday }
  end
end
