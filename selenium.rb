# selenium-webdriverを取り込む
require 'selenium-webdriver'

# ブラウザの指定(Chrome)
driver = Selenium::WebDriver.for :chrome

# ブラウザでURLに接続できるまで500秒まで待機する指示を出す
network = Selenium::WebDriver::Remote::Http::Default.new
network.read_timeout = 500

# ブラウザの指定(Chrome)
driver = Selenium::WebDriver.for :chrome, :http_client => network

# 指定したURLに遷移する
driver.get('https://www.instabase.jp/rentalspace')

# 単数のみ
# p driver.find_element(:xpath,"/html/body/div/section[2]/div/div/div[2]/div[2]/ul/li[1]/a/div[1]/div[1]/p").text
# p driver.find_element(:xpath,"/html/body/div/section[2]/div/div/div[2]/div[2]/ul/li[1]/a").attribute("href")

titles = []

# 複数対応
(1..20).each do |i|
    titles.push(driver.find_element(:xpath,"/html/body/div/section[2]/div/div/div[2]/div[2]/ul/li[#{i}]/a/div[1]/div[1]/p"))
end

# sec 秒だけプログラムの実行を停止
    sleep(5)
# p titles.text
# p "=============================================="

titles.each do |title|
    p title.text
end


# attribute,text
# 複数のケース
# class_name