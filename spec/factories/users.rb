FactoryBot.define do
  factory :user do
    nickname              {"ugajin"}
    email                 {"ugajin@gmail.com"}
    password              {"123456"}
    password_confirmation {"123456"}
    birthday              {19920101}
  end
end
