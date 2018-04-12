# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    send user.role
  end

  def guest; end

  def trader
    can :manage, Strategy
  end

  def admin
    trader
    can :manage, User
  end
end
