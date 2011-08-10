require 'spec_helper'

describe "LogsInOut" do
  before(:all) do
    # make sure a valid user exists first
    user = FactoryGirl.build(:user)
    user.save
  end

  it "signs in and out valid user" do
      visit '/'
      click_on 'Login'
      fill_in 'Email', :with => 'user@test.com'
      fill_in 'Password', :with => 'please'
      click_on 'Sign in'
      page.should have_content 'Signed in'

      click_on 'Logout'
      page.should have_content 'Signed out'
  end

  it "doesn't sign in invalid users" do
    visit '/'
    click_on 'Login'
    fill_in 'Email', :with => 'bad@user.com'
    fill_in 'Password', :with => 'nopass'
    click_on 'Sign in'
    page.should have_content 'Invalid'
  end

end
