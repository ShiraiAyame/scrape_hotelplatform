# selenium-webdriverを取り込む
require 'selenium-webdriver'
require 'csv'

# ブラウザでURLに接続できるまで500秒まで待機する指示を出す
network = Selenium::WebDriver::Remote::Http::Default.new
network.read_timeout = 500

# ブラウザの指定(Chrome)
driver = Selenium::WebDriver.for :chrome, :http_client => network

CSV.foreach("ikoyolistpage.csv") do |row|
    
    # urls.each do |url|
        driver.get(row[1])
        
        cur_url = driver.current_url
        sleep(5)

        title = driver.find_element(:css,".u-text--bold.u-text--xxl").text
        add = driver.find_element(:css,".c-ellipsis.p-facility-show__address").text
        genre = driver.execute_script("return window.dataLayer[1].genre")
        # p genre
        # p add
        CSV.open('file1.csv','a',:encoding => "utf-8") do |csv|
            csv << [cur_url, title, genre, add]
        end

    # end
 

end