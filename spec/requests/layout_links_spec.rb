require 'spec_helper'

describe "LayoutLinks" do

    it "should have a Home page at '/'" do
        visit '/'
        page.should have_selector('title', :content => "Home")
    end

    it "should have an About page at '/pages/about'" do
        visit '/pages/about'
        page.should have_selector('title', :content => "About")
    end

    it "should have proper links when not logged in" do
      visit '/'
      find('#nav-links').should have_content('Sign up')
      find('#nav-links').should have_content('Login')
    end

    it "should have proper links when logged in" do
      # I don't like having to create the user first like this
      # but I guess it's necessary...
      user = FactoryGirl.build(:user)
      user.save

      visit '/'
      click_on 'Login'
      fill_in 'Email', :with => 'user@test.com'
      fill_in 'Password', :with => 'please'
      click_on 'Sign in'
      find('#nav-links form').should have_selector('input', :type => 'submit', :value => 'Logout')
      find('#nav-links').should have_content('Edit account')
    end

end
