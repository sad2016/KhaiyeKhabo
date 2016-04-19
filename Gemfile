
source 'http://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby
gem 'nokogiri', '>= 1.6.6.2'


gem 'simplecov', :require => false, :group => :test
gem 'simplecov-rcov'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'groupdate'
gem 'chartkick'
gem 'active_median'

gem 'country_select'

gem 'bootstrap3-rails'
gem 'jquery-turbolinks'
gem 'bootstrap-datepicker-rails'
gem 'font-awesome-rails'
gem 'jquery-tokeninput-rails'
gem 'carrierwave',:git => 'https://github.com/satoruk/carrierwave.git' , :ref => '43179f94d6a4e62f69e812f5082d6447c9138480'
gem 'rmagick', require: false
gem "mini_magick"

gem 'ratyrate'
# Use ActiveModel has_secure_password
gem 'capybara'

# Use Unicorn as the app server
# gem 'unicorn'


group :test do
  gem 'cucumber-rails', :require => false
# database_cleaner is not required, but highly recommended
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'launchy'
  gem 'rspec-rails'
end

   gem "cancancan"
   gem 'devise'

# Use Capistrano for deployment
group :development do
   gem 'capistrano', '~> 3.2.1'
   gem 'capistrano-rbenv', '~> 2.0' # required
   gem 'capistrano-rbenv-install', '~> 1.2.0'
   gem 'capistrano-rails'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

