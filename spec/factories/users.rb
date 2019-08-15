FactoryBot.define do
  factory :user do
    nickname              {"ugajin"}
    password              {"123456"}
    password_confirmation {"123456"}
    birthday              {19920101}
    sequence(:email) {Faker::Internet.email}
  end
end
