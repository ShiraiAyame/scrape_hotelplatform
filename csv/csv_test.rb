require 'csv'

CSV.open('csvsample1.csv','a',:encoding => "utf-8") do |csv|
  # csv_string = csv.generate do |csv|
  ##ヘッダ
  csv << ["title","url"]
  ##データ１行目
  csv << ["全室スイートルーム！離島リゾートで至福の家族旅を満喫","https://iko-yo.net/listing_ads/23695/listing_clicks?n=49661419c84e709d3262f91c4f86278c82736db4p1p11p65325p0"]
  csv << ["成田ゆめ牧場","https://iko-yo.net/facilities/282"]
 end
print File.read("csvsample1.csv")

#  CSV.open("list.csv", "a") do |csv|
#    # CSVに入れたい内容を配列で記載する
#    # 何の機能もないミニマムだと、こんな感じ 
#    csv << ["取得したリストページのURL", "施設ページのURL"]
#    csv << ["https://iko-yo.net/facilities?page=5", "https://iko-yo.net/facilities/21453"]
#  end
#  print File.read("list.csv")