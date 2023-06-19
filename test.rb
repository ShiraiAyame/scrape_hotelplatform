# selenium-webdriverを取り込む
require 'selenium-webdriver'

network = Selenium::WebDriver::Remote::Http::Default.new
network.read_timeout = 500

driver = Selenium::WebDriver.for :chrome, :http_client => network


(1..2).each do |i|
    driver.get("https://iko-yo.net/facilities?page=#{i}")

    urls = []

    (2..18).each do |i|
        urls.push(driver.find_element(:xpath,"/html/body/div[2]/div[4]/main/div/div[3]/div[1]/div/section/div[4]/ul/li[#{i}]/div[1]/a/h3"))
    end

    print(driver.find_element(By.class_name, "c-word c-link_color--blue"))

    adds= []

    urls.each do |url|
        p url.text
    end

    adds.each do |add|
        p add.text
    end

end