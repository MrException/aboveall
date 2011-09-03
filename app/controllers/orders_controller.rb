class OrdersController < SecureController
  def new
    @order = Order.from_cart(current_user.cart)
  end

  def create
    @order = Order.from_cart(current_user.cart)
    @order.save
    redirect_to root_path, notice: 'Your Order Has Been Placed'
  end
end