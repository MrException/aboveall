class OrderMailer < ActionMailer::Base
  default from: "do.not.reply@aboveallcompassion.com"
  layout 'email'

  def new_order(order)
    @order = order
    mail to: order.user.email,
      subject: "New Order Received"
  end

  def order_shipped(order)
    @order = order
    mail to: order.user.email,
      subject: "Order Shipped"
  end
end
