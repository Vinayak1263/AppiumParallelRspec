# Prep ENV
		require 'json'
		require 'rest-client'
		ENV['BROWSERSTACK_USER'] = "USER_NAME"
		ENV['BROWSERSTACK_ACCESSKEY'] = "ACCESS_KEY"

# App Automate - Android Appium Parallel Tests
		devices_list = File.read('devices/devices.json')
		devices = JSON.parse(devices_list)['devices']
		appium_parallel_tests = Array.new

		def run_appium_parallel_test(device)
			command =  "device=\"#{device['device']}\" "
			command += "os_version=\"#{device['os_version']}\" "
			command += "project=\"#{device['project']}\" "
			command += "build=\"#{device['build']}\" "
			command += "name=\"#{device['name']}\" "
			command += "ruby appium_parallel.rb"
			system command
		end

		devices.each_with_index do |device, i|
			eval "appium_parallel_tests << :appium_parallel_test_#{i}"
			eval "task :appium_parallel_test_#{i} do run_appium_parallel_test(#{device}) end"
		end

		multitask :appium_parallel => appium_parallel_tests