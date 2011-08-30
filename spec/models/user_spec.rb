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
    FactoryGirl.create(:user)
    should validate_uniqueness_of(:email)
  }

  describe "New User" do
    it "should have it's role set to unauthorized" do
      u = User.new
      u.role.should_not be_nil
      u.should be_unauthorized
    end
  end

  describe "Save User" do
    it "can't be saved without an email" do
      user = FactoryGirl.build(:user, :email => '')
      user.should have(2).errors_on(:email)
    end

    it "can't be saved without a first name" do
      user = FactoryGirl.build(:user, :first_name => '')
      user.should have(1).error_on(:first_name)
    end

    it "can't be saved without a last name" do
      user = FactoryGirl.build(:user, :last_name => '')
      user.should have(1).error_on(:last_name)
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
end
