source 'http://rubygems.org'

gem 'rails', '~> 3.1.0'
#gem 'rails', :git => 'https://github.com/rails/rails.git', :branch => '3-1-stable'

gem 'newrelic_rpm'

gem 'mysql'

# Asset template engines
gem 'haml-rails'
gem 'jquery-rails'

gem 'sass-rails'
gem 'compass', '~> 0.12.alpha.0'
gem 'html5-boilerplate'

group :assets do
  gem 'coffee-rails'
  gem 'uglifier'
end

gem 'devise'
#gem 'devise', :git => 'https://github.com/plataformatec/devise.git', :branch => 'master'
gem 'cancan'

gem 'paperclip'
gem 'simple_form'
# since compass seems to be working now, not using bourbon
#gem 'bourbon'

group :development, :test do
  gem 'rspec-rails'
  gem 'spork', '~> 0.9.0.rc'
  gem 'database_cleaner'
  # potentially going to use these
  #gem 'launchy'
  #gem 'simplecov'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'shoulda', '>= 3.0.0.beta'
end

group :development do
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'guard-livereload'
  gem 'guard-rails'

  gem 'rb-inotify'
  gem 'libnotify'

  gem 'letter_opener'
end

group :production do
  gem 'unicorn'
end
