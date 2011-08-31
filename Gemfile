source 'http://rubygems.org'

gem 'rails', '~> 3.1.0'
#gem 'rails', :git => 'https://github.com/rails/rails.git', :branch => '3-1-stable'

gem 'sqlite3'

# Asset template engines
gem 'coffee-script'
gem 'uglifier'
gem 'haml-rails'
gem 'sass-rails'
gem 'jquery-rails'

gem 'devise'
#gem 'devise', :git => 'https://github.com/plataformatec/devise.git', :branch => 'master'
gem 'cancan'

gem 'paperclip'
gem 'simple_form'

group :development, :test do
  gem 'rspec-rails'
  gem 'spork', '~> 0.9.0.rc'
  gem 'database_cleaner'
  # potentially going to use these
  # gem 'launchy'
  #gem 'simplecov'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'shoulda'
end

group :development do
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'guard-livereload'
  gem 'guard-rails'

  gem 'rb-inotify'
  gem 'libnotify'
end

group :production do
  gem 'unicorn'
end
