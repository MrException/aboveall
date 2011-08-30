module ApplicationHelper
  def link_to_cart
    cart_id = session[:cart_id]
    cart_id = Cart.create.id unless cart_id
    link_to 'Shopping Cart', cart_path(cart_id)
  end
end
