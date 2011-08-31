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
      can :manage, ProductLineItem
    end
  end
end
