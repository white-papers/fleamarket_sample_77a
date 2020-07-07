FactoryBot.define do
  factory :product do
    size                    {"1"}
    status                  {"新品/未使用"}
    name                    {"果物"}
    estimated_delivery      {"1〜2日で発送"}
    shipping_fee_burden     {"着払い(購入者負担)"}
    prefectures             {"東京都"} 
    amount_of_money         {"100"} 
    # good_number             {""}
    product_details         {"1"}
    user_id                 {"1"}
    exhibitor_id            {"1"}
    # buyer_id                {""}
    category_id             {"1264"}
  end
end
