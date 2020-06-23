FactoryBot.define do
  factory :user do
    nickname              {"abe"}
    email                 {"kkk@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    family_name           {"田中"}
    given_name            {"太郎"}
    family_name_kana      {"タナカ"}  
    given_name_kana       {"タロウ"}
    birthday              {"1990-12-07"}
  end
end  