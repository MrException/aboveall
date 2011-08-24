require 'spec_helper'

describe User do
  describe "New User" do
    it "should have it's role set to unauthorized" do
      role = Factory.create(:unauthorized_role)
      u = User.new
      u.role.should_not be_nil
      u.role.should == role
    end
  end

  describe "Save User" do
    it "can't be saved without an email" do
      user = Factory.build(:user, :email => '')
      user.should have(2).errors_on(:email)
    end

    it "can't be saved without a first name" do
      user = Factory.build(:user, :first_name => '')
      user.should have(1).error_on(:first_name)
    end

    it "can't be saved without a last name" do
      user = Factory.build(:user, :last_name => '')
      user.should have(1).error_on(:last_name)
    end
  end

  describe "Roles" do

    before(:each) do
      @unauthorized_role = Factory.create(:unauthorized_role)
      @authorized_role = Factory.create(:authorized_role)
      @admin_role = Factory.create(:admin_role)
    end

    it "can be authorized" do
      u = User.new
      u.authorize
      u.role.should == @authorized_role
      u.authorized?.should == true
    end

    it "can be upgraded to an admin" do
      u = User.new
      u.make_admin
      u.role.should == @admin_role
      u.admin?.should == true
    end
  end
end
