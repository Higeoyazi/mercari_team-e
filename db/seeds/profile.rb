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