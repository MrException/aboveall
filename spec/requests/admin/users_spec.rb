require 'spec_helper'

describe 'Administrating Users' do

  it 'alows you to edit a user' do
      capy_login_admin
      visit root_path
      find('#navigation').click_on 'Users'

      # edit the second user, should be a regular user
      find('#user-list').all('tr.user').second.click_link 'Edit'

      page.select 'admin', :from => 'Role'

      page.click_button 'Update'
  end

  #
  # below this should maybe be moved to a view spec
  #
  
  context 'in the root of the application' do
    it 'does not have links visible to normal users' do
      capy_login_user
      visit root_path
      find('#navigation').should have_no_content 'Users'
    end
    it 'does have links visible to admin users' do
      capy_login_admin
      visit root_path
      find('#navigation').should have_content 'Users'
    end
  end

  context 'on the index list' do
    before(:each) do
      capy_login_admin
      FactoryGirl.create_list(:dummy_user, 5)
    end

    it 'should show a list of users' do
      visit root_path
      find('#navigation').click_on 'Users'
      # will have EIGHT users, the three created in spec_helper, and 5 dummy users
      find('#user-list').all('tr.user').count.should == 8

      # make sure the proper links exist in the table
      find('#user-list').find('tr.user').should have_link 'Edit'
      #find('#user-list').all('tr.user')[2].should have_link 'Authorize'
      #find('#user-list').all('tr.user')[0].should have_no_link 'Authorize'
    end

  end
end
