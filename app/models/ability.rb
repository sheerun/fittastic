class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?
      can :manage, user.team
      can :manage, User, :team_id => user.team.id
    else
      can :read, user.team
      can :read, User, :team_id => user.team.id
    end

    can :manage, Activity, :user_id => user.id
  end
end
