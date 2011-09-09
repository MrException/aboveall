class CartsController < SecureController
  def show
  end

  def update
    @cart.update_attributes(params[:cart])
    redirect_to action: 'show'
  end
end
