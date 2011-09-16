require 'spec_helper'

describe 'Administrating Users' do
  it 'alows you to edit a user' do
      capy_login_admin
      find('#navigation').click_on 'Users'
      # edit the second user, should be a regular user
      find('#user-list').all('tr.user').second.click_link 'Edit'
      page.select 'admin', :from => 'Role'
      page.click_button 'Update'
  end
end
