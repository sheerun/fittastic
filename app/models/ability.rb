class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, user.team
    else
      can :read, user.team
    end

    can :manage, Activity, :user_id => user.id
  end
end
