FactoryBot.define do
  factory :product do
    name{"NIKE"}
    description{"NIKE"}
    price{500}
    size{"L"}
    brand_name{"NIKE"}
    quality{1}
    delivery_cost{"出品者"}
    delivery_origin{"東京"}
    delivery_status{1}
    prep_days{"2~3日で発送"}
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    updated_at{ Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    category_id {1}
    user_id {1}
  end
end
