class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :create, Comment
    can :manage, User, id: user.id
    can :index, Product
    can :show, Product

    alias_action :create, :new, :update, :destroy, to: :product_crud

    if user.admin?
    	can :destroy, Comment
    	can :product_crud, Product
    end

  end

end