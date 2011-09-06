require 'rubygems'
require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However,
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.

  # This file is copied to spec/ when you run 'rails generate rspec:install'
  ENV["RAILS_ENV"] = 'test'

  require "rails/application"
  Spork.trap_method(Rails::Application::RoutesReloader, :reload!)

  require File.expand_path("../../config/environment.rb", __FILE__)

  #require 'simplecov'
  #SimpleCov.start

  require 'rspec/rails'

  require 'capybara/rspec'
  require 'capybara/rails'
  require 'paperclip/matchers'
  require 'database_cleaner'
  DatabaseCleaner.strategy = :truncation

  # for some reason FactoryGirl can not find my
  # factories unless I call this
  #FactoryGirl.find_definitions

  # Requires supporting ruby files with custom matchers and macros, etc,
  # in spec/support/ and its subdirectories.
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :rspec

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    # Using factory_girl, so commenting out
    #config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true

    # Include test helpers
    config.include RequestMacros
    config.extend ControllerMacros, :type => :controller

    config.include Paperclip::Shoulda::Matchers

    config.before(:all) do
      DatabaseCleaner.start
      DatabaseCleaner.clean
      FactoryGirl.create(:unauthorized_role)
      FactoryGirl.create(:authorized_role)
      FactoryGirl.create(:admin_role)
    end

    config.before(:each) do
      # stub out a bunch of paperclip methods
      # increases speed and reduces annoying log ouput
      # went from 83s to 62s
      Product.any_instance.stub(:save_attached_files).and_return(true)
      Product.any_instance.stub(:delete_attached_files).and_return(true)
      Product.any_instance.stub(:destroy_attached_files).and_return(true)
      Product.any_instance.stub(:prepare_for_destroy).and_return(true)
      Paperclip::Attachment.any_instance.stub(:post_process).and_return(true)
    end

    config.after(:all) do
      DatabaseCleaner.clean
    end
  end
end

Spork.each_run do
  # This code will be run each time you run your specs.

  # load the seed data
  #load "#{Rails.root}/db/seeds.rb"
  RSpec.configure do |config|
  end
end
