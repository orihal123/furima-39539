FactoryBot.define do
  factory :item do
    item_name                { 'test' }
    content                  { 'test@example' }
    price                    { rand(300..9_999_999) }
    category_id              { 2 }   # 適切なカテゴリーのIDを指定
    condition_id             { 2 }  # 適切な商品の状態のIDを指定
    shipping_fee_burden_id   { 2 }  # 適切な配送料の負担のIDを指定
    prefecture_id            { 2 }  # 適切な発送元の地域のIDを指定
    shipping_duration_id     { 2 }  # 適切な発送までの日数のIDを指定

    image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'test_image.jpg'), 'image/jpeg') }

    association :user
  end
end
