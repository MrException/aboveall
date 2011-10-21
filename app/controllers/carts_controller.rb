class CartsController < SecureController
  def show
    if @cart.user != current_user
      redirect_to root_path, alert: 'Access Denied'
    end
  end

  def update
    if @cart.update_attributes(params[:cart])
      redirect_to current_user.cart
    else
      redirect_to current_user.cart, alert: 'Error updating your cart!'
    end
  end
end
