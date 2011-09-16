require 'spec_helper.rb'

describe "Administration" do
  context 'in the root of the application' do
    it 'does not have links visible to normal users' do
      capy_login_user
      visit root_path
      find('#navigation').should have_no_content 'Users'
      find('#navigation').should have_no_content 'Orders'
    end
    it 'does have links visible to admin users' do
      capy_login_admin
      visit root_path
      find('#navigation').should have_content 'Users'
      find('#navigation').should have_content 'Orders'
    end
  end
end
