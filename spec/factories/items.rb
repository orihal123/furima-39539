FactoryBot.define do
  factory :item do
    item_name                { 'test' }
    content                  { 'test@example' }
    price                    { rand(300..9999999) }
    category_id              { 2 }   # 適切なカテゴリーのIDを指定
    condition_id             { 2 }  # 適切な商品の状態のIDを指定
    shipping_fee_burden_id   { 2 }  # 適切な配送料の負担のIDを指定
    prefecture_id            { 2 }  # 適切な発送元の地域のIDを指定
    shipping_duration_id     { 2 }  # 適切な発送までの日数のIDを指定
    
    association :user
  end
end





# 正常系

# ・全ての項目が入力されていれば出品できる

# 異常系

# ■商品画像
# ・商品画像が空では出品出来ない（@item.imageには空文字ではなくnilを代入する）

# ・
# ・
# ・
# ・
# ・
# ■価格 
# ・
# ・価格に半角数字以外が含まれている場合は出品できない（※半角数字以外が一文字でも含まれていれば良い）
# ・
# ・
# ■出品者情報
# ・userが紐付いていなければ出品できない