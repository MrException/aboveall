require 'spec_helper'

describe 'Administrating Users' do

  it 'alows you to edit a user' do
      capy_login_admin
      FactoryGirl.create_list(:dummy_user, 5)

      visit root_path
      find('#tab-nav').click_on 'Users'

      # should have SIX users, the admin, and 5 dummy users
      find('#user-list').all('tr.user').count.should == 6

      # edit the second user
      find('#user-list').all('tr.user').second.click_link 'Edit'

      page.select 'admin', :from => 'Role'

      page.click_botton 'Submit'
  end

  # below this should be moved to a view spec
  describe 'navigation' do
    it 'links should not be visible to normal users' do
      capy_login_user
      visit root_path
      find('#tab-nav').should have_no_content 'Users'
    end
    it 'links should be visible to admin users' do
      capy_login_admin
      visit root_path
      find('#tab-nav').should have_content 'Users'
    end
  end

  describe 'index' do
    before(:each) do
      capy_login_admin
      FactoryGirl.create_list(:dummy_user, 5)
    end

    it 'should show a list of users' do
      visit root_path
      find('#tab-nav').click_on 'Users'
      # will have SIX users, the admin, and 5 dummy users
      find('#user-list').all('tr.user').count.should == 6

      # make sure the proper links exist in the table
      find('#user-list').find('tr.user').should have_link 'Edit'
      #find('#user-list').all('tr.user')[2].should have_link 'Authorize'
      #find('#user-list').all('tr.user')[0].should have_no_link 'Authorize'
    end

  end

  describe 'authorizing' do
    it 'should be able to authorize a user'
  end
end
