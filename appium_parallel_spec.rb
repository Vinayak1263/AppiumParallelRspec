require 'rubygems'
require 'selenium-webdriver'
require 'test-unit'
require 'appium_lib'
require 'browserstack/local'
require_relative "spechelp"

describe 'Basic Wikipedia App interaction' do

	before(:each) do
		@driver = setup_driver
	
	end  
			
  it 'should send keys to Wikipedia search box' do
	  wait = Selenium::WebDriver::Wait.new(:timeout => 30)
		wait.until { @driver.find_element(:accessibility_id, "Search Wikipedia").displayed? }
		element = @driver.find_element(:accessibility_id, "Search Wikipedia")
		element.click

		wait.until { @driver.find_element(:id, "org.wikipedia.alpha:id/search_src_text").displayed? }
		search_box = @driver.find_element(:id, "org.wikipedia.alpha:id/search_src_text")
		search_box.send_keys("BrowserStack")

		wait.until { @driver.find_element(:class, "android.widget.TextView").displayed? }
		results = @driver.find_elements(:class, "android.widget.TextView")

		results_count = results.count

  end

  after(:all) do
	stop_driver
  end 

end
