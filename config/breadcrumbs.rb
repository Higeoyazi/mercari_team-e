# パンくずリストの設定です。
crumb :root do
  link "メルカリ", root_path
end

crumb :profile_mypages do
  link "マイページ", profile_mypages_url
  parent :root
end

crumb :edit_user do
  link "プロフィール", edit_user_url
  parent :profile_mypages
end

crumb :identification_mypages do
  link "本人情報", identification_mypages_url
  parent :profile_mypages
end

crumb :logout_mypages do
  link "ログアウト", logout_mypages_url
  parent :profile_mypages
end
