FactoryBot.define do
  factory :streetaddress do 
    postal_code     {"0000000"}
    city            {"名古屋市千種区"} 
    address         {"3-12"} 
    building        {"名古屋ビル"}  
    prefecture_id   {"1"}
  end
end  