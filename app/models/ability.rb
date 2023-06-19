# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user_record)
    if user_record.nil?
      anonymous
    elsif user_record.admin?
      admin
    elsif user_record.moderator?
      moderator
    elsif user_record.user?
      user
    end
  end

  private

  def admin
    can :manage, :all
  end

  def moderator
    can :manage, :all
    cannot %i[create edit destroy], User
  end

  def user
    cannot :manage, :all
  end

  def anonymous
    cannot :manage, :all
  end
end
