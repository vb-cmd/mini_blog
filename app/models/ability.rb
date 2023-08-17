# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user

    if @user.nil?
      anonymous
    elsif @user.administrator?
      administrator
    elsif @user.moderator?
      moderator
    end
  end

  private

  def administrator
    can :manage, :all
  end

  def moderator
    can :manage, Post, admin_user_id: @user.id
    can :manage, Comment
    can :manage, Like
    can :read, Category
    can :manage, Page, admin_user_id: @user.id
    can :manage, User
    can :read, ActiveAdmin::Page, name: 'Dashboard'
    can %i[read], AdminUser, id: @user.id
    cannot %i[new destroy], User
    cannot :publish, Comment, namespace_name: 'admin'
  end

  def anonymous
    cannot :manage, :all
  end
end