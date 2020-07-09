crumb :root do
  link "トップページ", root_path
end

crumb :mypage do |user|
  link "#{current_user.nickname}さん", user_path(current_user.id)
  parent :root
 end

 crumb :productshow do
  link "商品詳細", product_path
  parent :root
 end

 crumb :orders do
  link "商品購入", order_path
  parent :productshow
 end

 crumb :categories do
  link "カテゴリー", categories_path
  parent :root
 end

 crumb :credit_cards do
  link "クレジットカード", credit_cards_path
  parent :mypage
 end

 crumb :favorites do
  link "いいね一覧", product_favorites_path
  parent :mypage 
 end

 crumb :product_new do
  link "商品を出品する", new_product_path
  parent :root
 end

 crumb :log_out do
  link "ログアウト", log_out_user_path
  parent :mypage 
 end

 crumb :profile do
  link "プロフィール編集", profile_user_path
  parent :mypage
 end

 crumb :password do
  link "パスワード編集", edit_user_registration_path
  parent :mypage
 end

 crumb :deliveryaddress do
  link "お届け先住所変更", deliveryaddress_user_path
  parent :mypage
 end

 crumb :credit_cards do
  link "カードを登録", new_credit_card_path
  parent :mypage
 end
