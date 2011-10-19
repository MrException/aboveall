module ApplicationHelper
  def provinces
    ["Alberta",
     "British Columbia",
     "Manitoba",
     "New Brunswick",
     "Newfoundland",
     "Nova Scotia",
     "Ontario",
     "Prince Edward Island",
     "Quebec",
     "Saskatchewan",
     "Northwest Territories",
     "Nunavut",
     "Yukon"]
  end

  def current_cart
    current_user.cart
  end

  def cart_over_limit?
    current_cart.total_weight > current_user.possession_limit
  end
end
