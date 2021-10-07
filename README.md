
In Rakefile edit the ENV[BROWSERSTACK USER] &  ENV[BROWSERSTACK ACCESSKEY] and fill in the username and acess_key provided in browserstack dashboard 

In spechelp.rb set the caps['app'] with the [app url ](https://www.browserstack.com/docs/app-automate/appium/getting-started/ruby)


You can add devices in device.json file as per your requirements 

When using the repository for the first time to install gemfile.lock run the command gem install bundler


Commands to run the test on browserstack: 

rake appium_parallel
