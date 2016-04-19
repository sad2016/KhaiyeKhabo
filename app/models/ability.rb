class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
      # can :update, Auth, [:isbanned]
      # cannot :update, Auth, [:email, ], :auth_id != auth.id

    elsif user.member?
      can :show, User
      can :read, Cookcategory
      can :create, Contact
      can :update, User do |u|
        u.try(:id) == user.id
      end
      can :create, Comment
      can :read, Recipe
      can :myrecipe, Recipe
      can :search, Recipe
      can :searchcuisine, Recipe
      can :destroy, Recipe do |u|
        u.try(:user_id) == user.id
      end
      can :update, Recipe do |u|
          u.try(:user_id) == user.id
      end
      can :create, Recipe
    else
      can :read, Cookcategory
      can :create, Contact
      can :show, Recipe
      can :read, Recipe
      can :search, Recipe
      can :searchcuisine, Recipe
    end
  end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
end
