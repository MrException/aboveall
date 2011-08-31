class ProductLineItemsController < SecureController
  def create
    begin
      @product = Product.find(params[:product_id])
    rescue ActiveRecord::RecordNotFound
      redirect_to root_path, alert: "Unable to add item to your cart."
      return
    end

    @line_item = ProductLineItem.new ({
      product: @product,
      cart: current_user.cart
    })
    if @line_item.save
      redirect_to current_user.cart
    else
      redirect_to root_path, alert: "Unable to add item to your cart."
    end
  end

end
