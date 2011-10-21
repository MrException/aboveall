class Ability
  include CanCan::Ability

  def initialize(user)

    # guest user (not logged in)
    # will have role of 'unauthorized'
    user ||= User.new

    if user.admin?
      can :manage, :all
    elsif user.authorized?
      can :read, Product

      can :read, Cart
      can :update, Cart

      can :manage, ProductLineItem

      can :create, Order
      can :show, Order

      can :read, Payment
      can :update, Payment
    end
  end
end
