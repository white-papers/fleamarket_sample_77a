FactoryBot.define do
  factory :deliveryaddress do 
    family_name           {"田中"}
    given_name            {"太郎"}
    family_name_kana      {"タナカ"}  
    given_name_kana       {"タロウ"}
    postal_code           {"0000000"}
    city                  {"名古屋市千種区"} 
    address               {"3-12"} 
    building              {"名古屋ビル"}  
    phone_number          {"08023456789"}
    prefecture_id         {"1"}
  end
end  