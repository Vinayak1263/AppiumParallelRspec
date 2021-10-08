# appium-parallel-browserstack


![BrowserStack Logo](https://d98b8t1nnulk5.cloudfront.net/production/images/layout/logo-header.png?1469004780)

## Using Rspec

### Setup

* In Rakefile edit the ENV[BROWSERSTACK USER] &  ENV[BROWSERSTACK ACCESSKEY] and fill in the username and acess_key provided in browserstack dashboard 

* In spechelp.rb set the caps['app'] with the [app url ](https://www.browserstack.com/docs/app-automate/appium/getting-started/ruby)

* You can add devices in device.json file as per your requirements 

* When using the repository for the first time to install gemfile.lock run the command gem install bundler
 
### Running your tests

rake appium_parallel

 Understand how many parallel sessions you need by using our [Parallel Test Calculator](https://www.browserstack.com/automate/parallel-calculator?ref=github)


## Notes
* You can view your test results on the [BrowserStack App Automate dashboard](https://www.browserstack.com/app-automate)

* [Using REST API to access information about your tests via the command-line interface](https://www.browserstack.com/automate/rest-api)







