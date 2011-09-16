require 'spec_helper'

describe 'Administrating Orders' do
  before(:each) do
    FactoryGirl.create_list(:order, 5)
    capy_login_admin
    find('#navigation').click_on 'Orders'
  end

  it 'alows you to view orders' do
    find('#order-list').all('tr.order').length.should eq 5
  end

  it 'allows you to edit orders' do
    find('#order-list').first('tr.order').click_on 'Edit'
  end
end
