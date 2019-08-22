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