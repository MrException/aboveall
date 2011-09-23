require 'spec_helper'

describe User do
  it { should have_one(:cart) }
  it { should belong_to(:role) }
  it "should validate presence of necessary fields" do
    should validate_presence_of(:first_name)
    should validate_presence_of(:last_name)
    should validate_presence_of(:email)
  end
  it {
    should validate_uniqueness_of(:email)
  }

  describe "New User" do
    it "should have it's role set to unauthorized" do
      u = User.new
      u.role.should_not be_nil
      u.should be_unauthorized
    end

    it "should have a cart set up" do
      u = User.new
      u.cart.should_not be_nil
    end
  end

  describe "Roles" do
    it "can be authorized" do
      u = User.new
      u.authorize!
      u.role.should_not be_nil
      u.should be_authorized
    end

    it "can be upgraded to an admin" do
      u = User.new
      u.make_admin!
      u.role.should_not be_nil
      u.should be_admin
    end
  end

  context "#name" do
    it "should return the full name as 'lname, fname'" do
      user = FactoryGirl.build(:user)
      user.full_name.should eq "#{user.last_name}, #{user.first_name}"
    end
  end
end
