# selenium-webdriverを取り込む
require 'selenium-webdriver'
require 'csv'

# ブラウザでURLに接続できるまで500秒まで待機する指示を出す
network = Selenium::WebDriver::Remote::Http::Default.new
network.read_timeout = 500

# ブラウザの指定(Chrome)
driver = Selenium::WebDriver.for :chrome, :http_client => network

# 「いこーよ」施設名と施設ページの取得
(1..10).each do |i|
    driver.get("https://iko-yo.net/facilities?page=#{i}")

    sleep(5)

    cur_url = driver.current_url
    print(cur_url)

    (1..15).each do |i|
        title = driver.find_element(:xpath,"/html/body/div[2]/div[4]/main/div/div[3]/div[1]/div/section/div[4]/ul/li[#{i}]/div[1]/a/h3").text
        url = driver.find_element(:xpath,"/html/body/div[2]/div[4]/main/div/div[3]/div[1]/div/section/div[4]/ul/li[#{i}]/div[1]/a").attribute("href")
        CSV.open('csv1.csv','a',:encoding => "utf-8") do |csv|
            csv << [cur_url, title, url]
        end

    end

    # titles.each do |title|
    #     p title
    # end
    # urls.each do |url|
    #     p url
    # end
end
