class OrdersController < SecureController
  prepend_before_filter :find_order, only: :show

  def show
    if @order.user != current_user
      redirect_to root_path, alert: "Access Denied"
    end
  end

  def new
    return if redirect_if_cart_empty
    return if redirect_if_limit_exceeded

    @order = Order.from_cart(current_cart)
  end

  def create
    return if redirect_if_cart_empty
    return if redirect_if_limit_exceeded

    if @order = Order.checkout(current_cart)
      render action: "show", notice: 'Your Order Has Been Placed'
    else
      redirect_to new_order_path, alert: 'Error checking out!'
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

  def find_order
    begin
      @order = Order.find([params[:id]]).first
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "That order doesn't exist!"
    end
  end
end
