class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

  def current_cart
    current_user.cart
  end

  def cart_over_limit?
    current_cart.total_weight > current_user.possession_limit
  end
end
