class OrdersController < SecureController
  def new
    return if redirect_if_cart_empty

    @order = Order.from_cart(current_user.cart)
  end

  def create
    return if redirect_if_cart_empty

    if @order = Order.checkout(current_user.cart)
      redirect_to root_path, notice: 'Your Order Has Been Placed'
    else
      redirect_to new_order_path, error: 'Error checking out!'
    end
  end

  private

  def redirect_if_cart_empty
    if current_user.cart.empty?
      redirect_to current_user.cart, notice: 'Your Cart is empty.'
      true
    end
  end
end
