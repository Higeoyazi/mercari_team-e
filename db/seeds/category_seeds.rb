categoryies = {
  lady: 'レディース',
  men: 'メンズ',
  baby: 'ベビー・キッズ',
  interior: 'インテリア・住まい・小物',
  book: '本・音楽・ゲーム',
  toy: 'おもちゃ・ホビー・グッズ',
  cosme: 'コスメ・香水・美容',
  home_appliance: '家電・スマホ・カメラ',
  suports: 'スポーツ・レジャー',
  handmaid: 'ハンドメイド',
  ticket: 'チケット',
  bicycle: '自転車・オートバイ',
  others: 'その他'
}

# 親カテゴリーを作る
categoryies.each do |key, value|
  key = Category.create(name: value)
end