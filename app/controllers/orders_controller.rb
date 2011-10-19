class OrdersController < SecureController
  def new
    return if redirect_if_cart_empty
    return if redirect_if_limit_exceeded

    @order = Order.from_cart(current_cart)
  end

  def create
    return if redirect_if_cart_empty
    return if redirect_if_limit_exceeded

    if @order = Order.checkout(current_cart)
      redirect_to root_path, notice: 'Your Order Has Been Placed'
    else
      redirect_to new_order_path, error: 'Error checking out!'
    end
  end

  private

  def redirect_if_cart_empty
    if current_cart.empty?
      redirect_to current_user.cart, notice: 'Your Cart is empty.'
    end
  end

  def redirect_if_limit_exceeded
    if cart_over_limit?
      redirect_to current_user.cart
    end
  end
end
