source 'http://rubygems.org'

#gem 'rails', '~> 3.1.0.rc'
gem 'rails', :git => 'https://github.com/rails/rails.git', :branch => '3-1-stable'

gem 'sqlite3'

# Asset template engines
gem 'coffee-script'
gem 'uglifier'
gem 'haml-rails'
gem 'sass-rails'
gem 'jquery-rails'

gem 'unicorn'

gem 'devise'

# potentially going to use these
# gem 'launchy'
# gem 'paperclip'
# gem 'shoulda'

gem 'cancan'

group :development, :test do
  gem 'rspec-rails'
  gem 'spork', '~> 0.9.0.rc'
  gem 'simplecov'
  gem 'pry'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
end

group :development do
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'guard-livereload'
  gem 'guard-rails'

  gem 'rb-inotify'
  gem 'libnotify'
end
