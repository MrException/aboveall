require "spec_helper"

describe RoleMailer do
  let(:user) { mock_model User,
               first_name: "Jon",
               email: "me@here.com"  }

  describe "#authorized" do
    let(:mail) { RoleMailer.authorized(user) }

    it "sends the authorization email" do
      mail.subject.should eq("Account Authorization")
      mail.to.should eq([user.email])
      mail.from.should eq(["do.not.reply@aboveallcompassion.com"])
    end
  end

  describe "#unauthorized" do
    let(:mail) { RoleMailer.unauthorized(user) }

    it "sends the unauthorization email" do
      mail.subject.should eq("Account De-Authorization")
      mail.to.should eq([user.email])
      mail.from.should eq(["do.not.reply@aboveallcompassion.com"])
    end
  end
end
