# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user_record)
    return if user_record.nil?

    case user_record.role
    when 'admin'
      admin
    when 'moderator'
      moderator
    when 'user'
      user
    end
  end

  private

  def admin
    can :manage, :all
  end

  def moderator
    can :manage, Category
    can :manage, Post
    can :manage, Comment
    can :manage, Page
    can %i[read posts], User
  end

  def user
    nil
  end
end
