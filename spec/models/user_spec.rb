require 'spec_helper'

describe User do
  it { should have_one(:cart) }
  it { should belong_to(:role) }
  it "should validate presence of necessary fields" do
    should validate_presence_of(:first_name)
    should validate_presence_of(:last_name)
    should validate_presence_of(:email)
    should validate_presence_of(:road)
    should validate_presence_of(:city)
    should validate_presence_of(:province)
    should validate_presence_of(:postal_code)
    should validate_presence_of(:gender)
    should validate_presence_of(:dob)
    should validate_presence_of(:license_number)
    should validate_presence_of(:possession_limit)
    should validate_presence_of(:license_expiry)
  end
  it "should allow mass assignment of fields" do
    should allow_mass_assignment_of(:first_name)
    should allow_mass_assignment_of(:last_name)
    should allow_mass_assignment_of(:email)
    should allow_mass_assignment_of(:road)
    should allow_mass_assignment_of(:apt_number)
    should allow_mass_assignment_of(:city)
    should allow_mass_assignment_of(:province)
    should allow_mass_assignment_of(:postal_code)
    should allow_mass_assignment_of(:gender)
    should allow_mass_assignment_of(:dob)
    should allow_mass_assignment_of(:license_number)
    should allow_mass_assignment_of(:possession_limit)
    should allow_mass_assignment_of(:license_expiry)
  end
  it {
    should validate_uniqueness_of(:email)
  }
  describe "license attachment" do
    it { should have_attached_file(:license) }
    it { should validate_attachment_content_type(:license).
         allowing('image/png', 'image/gif').
         rejecting('text/plain', 'text/xml') }
    it { should validate_attachment_size(:license).
         less_than(2.megabytes) }
  end

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
