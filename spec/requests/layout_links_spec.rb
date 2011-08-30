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

    find('#nav-links').should have_no_selector('input', :type => 'submit', :value => 'Logout')
    find('#nav-links').should have_no_content('Edit account')
    find('#nav-links').should have_no_content('Cart')
  end

  it "should have proper links when logged in" do
    capy_login_user

    find('#nav-links').should have_selector('input', :type => 'submit', :value => 'Logout')
    find('#nav-links').should have_content('Edit account')
    find('#nav-links').should have_content('Cart')

    find('#nav-links').should have_no_content('Sign up')
    find('#nav-links').should have_no_content('Login')
  end

end
