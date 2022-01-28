require 'rubygems'
require 'selenium-webdriver'
require 'test-unit'
require 'appium_lib'
require 'browserstack/local'
require_relative "spechelp"
require "test/unit"

describe 'Basic Wikipedia App interaction' do

	before(:each) do
		@driver = setup_driver
	
	end  

	begin
		
	

  it 'should send keys to Wikipedia search box' do
	#   wait = Selenium::WebDriver::Wait.new(:timeout => 30)
	  #@driver.manage.timeouts.implicit_wait = 10
		
	  exception = Selenium::WebDriver::Error::NoSuchElementError
	  wait = Selenium::WebDriver::Wait.new(timeout: 30, interval: 5, message: 'Timed out after 30 sec', ignore: exception)

	   wait.until { @driver.find_element(:accessibility_id, "Search Wikipedia").displayed? }
		element = @driver.find_element(:accessibility_id, "Search Wikipedia")
		element.click

		 wait.until { @driver.find_element(:id, "org.wikipedia.alpha:id/search_src_tex").displayed? }
		search_box = @driver.find_element(:id, "org.wikipedia.alpha:id/search_src_tex")
		search_box.send_keys("BrowserStack")

		wait.until { @driver.find_element(:class, "android.widget.TextView").displayed? }
		results = @driver.find_elements(:class, "android.widget.TextView")

		results_count = results.count
		
		if (results_count)
			@driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"passed", "reason": "Test Passed"}}')
		  else
			@driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed", "reason": "Test Failed"}}')
  end

rescue =>   Selenium::WebDriver::Error::TimeoutError
	puts 'Element not found'
	@driver.execute_script('browserstack_executor: {"action": "setSessionStatus", "arguments": {"status":"failed", "reason": "Test Failed"}}')
		
end

end




  after(:all) do
	stop_driver
  end 
end
