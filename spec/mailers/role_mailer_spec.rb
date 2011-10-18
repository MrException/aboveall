require "spec_helper"

describe RoleMailer do
  let(:user) { mock_model(User).as_null_object }

  describe "#authorized" do
    let(:mail) { RoleMailer.authorized(user) }

    it "sends the authorization email" do
      user.stub!(:first_name).and_return 'Jon'
      mail.subject.should eq("Account Authorization")
      mail.to.should eq(user.email)
      mail.from.should eq(["no-reply@aboveallcompassion.com"])
    end
  end

  describe "#unauthorized" do
    let(:mail) { RoleMailer.unauthorized(user) }

    it "sends the unauthorization email" do
      user.stub!(:first_name).and_return 'Jon'
      mail.subject.should eq("Account De-Authorization")
      mail.to.should eq(user.email)
      mail.from.should eq(["no-reply@aboveallcompassion.com"])
    end
  end
end
