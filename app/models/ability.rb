class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role?(:admin)
      can :manage, :all
    else
      can :read, Shift
      can :manage, TimeLog, user_id: user.id
      can :read, ShiftAssignment, user_id: user.id
    end
  end
end