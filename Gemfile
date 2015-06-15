source 'http://rubygems.org'

ruby '1.9.3'

gem 'rails', '~> 3.2.16'

gem 'aws-ses', '~> 0.4.4', :require => 'aws/ses'
gem 'chosen-rails'
gem 'coderay', '~> 1.0.5'
gem 'devise', '~> 3.0.4'
gem 'exception_notification', :require => 'exception_notifier'
gem 'fakefs', :require => 'fakefs/safe'
gem 'jquery-rails'
gem 'kaminari'
gem 'mongoid', '>= 3.1.0', :git => "git://github.com/mongoid/mongoid", :ref => "367fc3f066252c839e04710e1ea5682aae33e6c2"
gem 'mongoid-audit'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-github'
gem 'omniauth-openid'
gem 'rack-timeout'
gem 'rinku'
gem 'rubyheap', '~> 0.1.2'
gem "sicuro", "~> 0.21.0"
gem 'trackman'
gem 'twitter'
gem 'uuid', '~> 2.3.5'
gem 'execjs'
gem 'therubyracer'
gem 'thin'
gem 'figaro', github: 'laserlemon/figaro'

# Gems used only for assets and not required in production environments
# by default.
group :assets do
  gem 'coffee-rails', '~> 3.2.1'
  gem 'sass-rails',   '~> 3.2.3'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem 'newrelic_rpm'
end

group :test, :development do
  # Pretty printed test output
  gem 'awesome_print'
  gem 'interactive_editor'
  gem 'launchy'
  gem 'letter_opener'
  gem 'rspec-rails', '~> 2.8'
  gem 'selenium-webdriver'
  gem 'turn', '0.8.2', :require => false
end

group :development do
  gem 'heroku'
  # gem 'byebug', '~> 5.0.0'
  # gem 'columnize', '~> 0.9.0'
end

group :test do
  gem 'capybara'
  gem 'cucumber-rails'
  gem 'database_cleaner'
end
