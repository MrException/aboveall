require "spec_helper"

describe OrderMailer do
  let(:user) { mock_model User,
               first_name: "Jon",
               email: "me@here.com" }

  let(:order) { mock_model Order, 
                user: user }

  describe "new_order" do
    let(:mail) { OrderMailer.new_order(order) }

    it "renders the headers" do
      mail.subject.should eq("New Order Received")
      mail.to.should eq([order.user.email])
      mail.from.should eq(["do.not.reply@aboveallcompassion.com"])
    end
  end

  describe "order_shipped" do
    let(:mail) { OrderMailer.order_shipped(order) }

    it "renders the headers" do
      mail.subject.should eq("Order Shipped")
      mail.to.should eq([order.user.email])
      mail.from.should eq(["do.not.reply@aboveallcompassion.com"])
    end
  end

end
