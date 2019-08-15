FactoryBot.define do
  factory :product do
    name{"NIKE"}
    description{"NIKE"}
    price{"100"}
    size{"L"}
    brand_name{"NIKE"}
    quality{"1"}
    delivery_origin{"東京"}
    delivery_status{"5"}
    user
    created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
  end
end
