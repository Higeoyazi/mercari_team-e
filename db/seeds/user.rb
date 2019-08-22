User.create!(
  nickname:              "ugajin",
  password:              "123456",
  password_confirmation: "123456",
  birthday:              19920101,
  email: "aa@gmail.com"
)
Profile.create!(
  family_name:         "高崎",
  first_name:          "優作",
  family_name_kana:   "タカサキ",
  first_name_kana:     "ユウサク",
  phone_number:        "08068057646",
  created_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now), 
  updated_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
  user_id:1
)
Address.create!(
  postal_code:   123,
  prefecture:    "北海道",
  city:          "横浜市緑区",
  block:         1223,
  building:      123,
  created_at: Faker::Time.between(from: DateTime.now - 2, to: DateTime.now), 
  updated_at:Faker::Time.between(from: DateTime.now - 2, to: DateTime.now),
  user_id: 1
)
CreditCard.create!(
  customer_id:"cus_b4cb4126571370740c3573890565",
  card_id:"car_b3a43ef573c49c5170b6c69ac485",
  user_id:1
)