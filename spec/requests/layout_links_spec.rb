require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    visit '/'
    page.should have_selector('title', :content => "Home")
  end

  it "should have proper links when not logged in" do
    visit '/'
    find('#navigation').should have_content('Sign up')
    find('#navigation').should have_content('Login')

    find('#navigation').should have_no_selector('input', :type => 'submit', :value => 'Logout')
    find('#navigation').should have_no_content('Edit account')
    find('#navigation').should have_no_content('Cart')
  end

  it "should have proper links when logged in" do
    capy_login_user

    find('#navigation').should have_selector('input', :type => 'submit', :value => 'Logout')
    find('#navigation').should have_content('Edit account')
    find('#navigation').should have_content('Cart')

    find('#navigation').should have_no_content('Sign up')
    find('#navigation').should have_no_content('Login')
  end

end
