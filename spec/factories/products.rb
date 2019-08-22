FactoryBot.define do
  factory :product do
    name{Faker::Name.name}
    description{"ナイキのボーダー長袖Tシャツです。
    サイズは90です。
    特に汚れは見当たりません。
    自宅保管していました。"}
    price{Faker::Number.within(range: 300..999999)}
    size{"L"}
    brand_name{"NIKE"}
    quality{"新品、未使用"}
    delivery_cost{"送料込み(出品者負担)"}
    delivery_origin{"東京"}
    delivery_status{1}
    prep_days{"2~3日で発送"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    updated_at{ Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    category_id {1}
    user_id {1}
  end
end
