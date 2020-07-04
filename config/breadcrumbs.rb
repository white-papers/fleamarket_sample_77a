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
  link "出品入力", new_product_path
  parent :root
 end

 crumb :log_out do
  link "ログアウト", log_out_user_path
  parent :mypage 
 end