1.upto(10) do |n|
  Product.create!(
    name: Faker::DcComics.heroine,
    description:"ナイキのボーダー長袖Tシャツです。
                サイズは90です。
                特に汚れは見当たりません。
                自宅保管していました。",
    price:Faker::Number.within(range: 300..9999),
    size:"L",
    brand_name:"NIKE",
    quality:"新品、未使用",
    delivery_cost:"送料込み(出品者負担)",
    delivery_origin:"東京",
    delivery_status:0,
    prep_days:"2~3日で発送",
    status:0,
    created_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    category_id:1,
    user_id:1
    )
end
11.upto(20) do |n|
  Product.create!(
    name: Faker::DcComics.hero,
    description:"ナイキのボーダー長袖Tシャツです。
                サイズは90です。
                特に汚れは見当たりません。
                自宅保管していました。",
    price:Faker::Number.within(range: 300..9999),
    size:"L",
    brand_name:"NIKE",
    quality:"新品、未使用",
    delivery_cost:"送料込み(出品者負担)",
    delivery_origin:"東京",
    delivery_status:0,
    prep_days:"2~3日で発送",
    status:0,
    created_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    category_id:200,
    user_id:1
    )
end
21.upto(30) do |n|
  Product.create!(
    name: Faker::JapaneseMedia::DragonBall.character,
    description:"ナイキのボーダー長袖Tシャツです。
                サイズは90です。
                特に汚れは見当たりません。
                自宅保管していました。",
    price:Faker::Number.within(range: 300..9999),
    size:"L",
    brand_name:"NIKE",
    quality:"新品、未使用",
    delivery_cost:"送料込み(出品者負担)",
    delivery_origin:"東京",
    delivery_status:0,
    prep_days:"2~3日で発送",
    status:0,
    created_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    category_id:346,
    user_id:1
    )
end
31.upto(40) do |n|
  Product.create!(
    name: Faker::Name.name,
    description:"ナイキのボーダー長袖Tシャツです。
                サイズは90です。
                特に汚れは見当たりません。
                自宅保管していました。",
    price:Faker::Number.within(range: 300..9999),
    size:"L",
    brand_name:"NIKE",
    quality:"新品、未使用",
    delivery_cost:"送料込み(出品者負担)",
    delivery_origin:"東京",
    delivery_status:0,
    prep_days:"2~3日で発送",
    status:0,
    created_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    category_id:481,
    user_id:1
    )
end
41.upto(50) do |n|
  Product.create!(
    name: Faker::Book.title,
    description:"ナイキのボーダー長袖Tシャツです。
                サイズは90です。
                特に汚れは見当たりません。
                自宅保管していました。",
    price:Faker::Number.within(range: 300..9999),
    size:"L",
    brand_name:"NIKE",
    quality:"新品、未使用",
    delivery_cost:"送料込み(出品者負担)",
    delivery_origin:"東京",
    delivery_status:0,
    prep_days:"2~3日で発送",
    status:0,
    created_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    category_id:623,
    user_id:1
    )
end
51.upto(60) do |n|
  Product.create!(
    name: Faker::JapaneseMedia::OnePiece.character,
    description:"ナイキのボーダー長袖Tシャツです。
                サイズは90です。
                特に汚れは見当たりません。
                自宅保管していました。",
    price:Faker::Number.within(range: 300..9999),
    size:"L",
    brand_name:"NIKE",
    quality:"新品、未使用",
    delivery_cost:"送料込み(出品者負担)",
    delivery_origin:"東京",
    delivery_status:0,
    prep_days:"2~3日で発送",
    status:0,
    created_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    category_id:682,
    user_id:1
    )
end
61.upto(70) do |n|
  Product.create!(
    name: Faker::Name.name,
    description:"ナイキのボーダー長袖Tシャツです。
                サイズは90です。
                特に汚れは見当たりません。
                自宅保管していました。",
    price:Faker::Number.within(range: 300..9999),
    size:"L",
    brand_name:"NIKE",
    quality:"新品、未使用",
    delivery_cost:"送料込み(出品者負担)",
    delivery_origin:"東京",
    delivery_status:0,
    prep_days:"2~3日で発送",
    status:0,
    created_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    category_id:795,
    user_id:1
    )
end
71.upto(80) do |n|
  Product.create!(
    name: Faker::Commerce.product_name,
    description:"ナイキのボーダー長袖Tシャツです。
                サイズは90です。
                特に汚れは見当たりません。
                自宅保管していました。",
    price:Faker::Number.within(range: 300..9999),
    size:"L",
    brand_name:"NIKE",
    quality:"新品、未使用",
    delivery_cost:"送料込み(出品者負担)",
    delivery_origin:"東京",
    delivery_status:0,
    prep_days:"2~3日で発送",
    status:0,
    created_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    category_id:895,
    user_id:1
    )
end
81.upto(90) do |n|
  Product.create!(
    name: Faker::Name.name,
    description:"ナイキのボーダー長袖Tシャツです。
                サイズは90です。
                特に汚れは見当たりません。
                自宅保管していました。",
    price:Faker::Number.within(range: 300..9999),
    size:"L",
    brand_name:"NIKE",
    quality:"新品、未使用",
    delivery_cost:"送料込み(出品者負担)",
    delivery_origin:"東京",
    delivery_status:0,
    prep_days:"2~3日で発送",
    status:0,
    created_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    category_id:982,
    user_id:1
    )
end
91.upto(100) do |n|
  Product.create!(
    name: Faker::Name.name,
    description:"ナイキのボーダー長袖Tシャツです。
                サイズは90です。
                特に汚れは見当たりません。
                自宅保管していました。",
    price:Faker::Number.within(range: 300..9999),
    size:"L",
    brand_name:"NIKE",
    quality:"新品、未使用",
    delivery_cost:"送料込み(出品者負担)",
    delivery_origin:"東京",
    delivery_status:0,
    prep_days:"2~3日で発送",
    status:0,
    created_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    category_id:1091,
    user_id:1
    )
end
101.upto(110) do |n|
  Product.create!(
    name: Faker::Name.name,
    description:"ナイキのボーダー長袖Tシャツです。
                サイズは90です。
                特に汚れは見当たりません。
                自宅保管していました。",
    price:Faker::Number.within(range: 300..9999),
    size:"L",
    brand_name:"NIKE",
    quality:"新品、未使用",
    delivery_cost:"送料込み(出品者負担)",
    delivery_origin:"東京",
    delivery_status:0,
    prep_days:"2~3日で発送",
    status:0,
    created_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    category_id:1142,
    user_id:1
    )
end
111.upto(120) do |n|
  Product.create!(
    name: Faker::Vehicle.model,
    description:"ナイキのボーダー長袖Tシャツです。
                サイズは90です。
                特に汚れは見当たりません。
                自宅保管していました。",
    price:Faker::Number.within(range: 300..9999),
    size:"L",
    brand_name:"NIKE",
    quality:"新品、未使用",
    delivery_cost:"送料込み(出品者負担)",
    delivery_origin:"東京",
    delivery_status:0,
    prep_days:"2~3日で発送",
    status:0,
    created_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    category_id:1202,
    user_id:1
    )
end
121.upto(130) do |n|
  Product.create!(
    name: Faker::Name.name,
    description:"ナイキのボーダー長袖Tシャツです。
                サイズは90です。
                特に汚れは見当たりません。
                自宅保管していました。",
    price:Faker::Number.within(range: 300..9999),
    size:"L",
    brand_name:"NIKE",
    quality:"新品、未使用",
    delivery_cost:"送料込み(出品者負担)",
    delivery_origin:"東京",
    delivery_status:0,
    prep_days:"2~3日で発送",
    status:0,
    created_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    updated_at: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
    category_id:1265,
    user_id:1
    )
end