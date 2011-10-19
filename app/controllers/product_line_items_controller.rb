class ProductLineItemsController < SecureController
  def create
    if current_cart.add_product(params[:product_id])
      redirect_to current_cart
    else
      redirect_to root_path, alert: "Unable to add item to your cart."
    end
  end
end
