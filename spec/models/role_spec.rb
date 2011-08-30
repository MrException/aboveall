require 'spec_helper'

describe Role do
  it { should validate_uniqueness_of(:name) }
  it { should validate_presence_of(:name) }
  it { should have_many(:users) }

  it 'should return something from "admin"' do
    Role.admin.should_not be_nil
  end
  it 'should return something from "unauthorized"' do
    Role.unauthorized.should_not be_nil
  end
  it 'should return something from "authorized"' do
    Role.authorized.should_not be_nil
  end
end
