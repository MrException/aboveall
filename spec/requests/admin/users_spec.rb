require 'spec_helper'

describe 'Administrating Users' do
  before do
    capy_login_admin
  end

  it 'alows you to edit a user' do
    find('#navigation').click_on 'Users'
    # second user should be a normal user
    # don't like relying on this, could fail one day
    find('#user-list').all('tr.user').second.click_link 'Edit'
    page.click_button 'Update'
  end

  it 'allows you to authorize a user' do
    find('#navigation').click_on 'Users'
    # there has to be at least one user who is unauthorized
    click_link 'Authorize'
    page.should have_content 'was authorized.'
  end
end
