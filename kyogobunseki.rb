# selenium-webdriverを取り込む
require 'selenium-webdriver'

# ブラウザの指定(Chrome)
driver = Selenium::WebDriver.for :chrome

# 指定したURLに遷移する
(2..10).each do |i|
    driver.get("https://aumo.jp/?page=#{i}")

    titles = []

    # 複数対応
    (1..25).each do |i|
        titles.push(driver.find_element(:xpath,"/html/body/div[1]/div[1]/div[1]/div/div[1]/div[2]/div[#{i}]/div[2]/div[1]"))
    end

    titles.each do |title|
        p title.text
    end
end