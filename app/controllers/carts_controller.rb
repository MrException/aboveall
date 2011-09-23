class CartsController < SecureController
  def show
  end

  def update
    if @cart.update_attributes(params[:cart])
      redirect_to current_user.cart
    else
      redirect_to current_user.cart, alert: 'Error updating your cart!'
    end
  end
end
