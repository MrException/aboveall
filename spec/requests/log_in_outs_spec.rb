require 'spec_helper'

describe "LogsInOut" do
  context 'not logged in' do
    it 'signs in and out valid user' do
      capy_login_user
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

end
