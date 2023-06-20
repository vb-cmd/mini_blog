module Admin::UsersHelper
  def all_user_roles
    User.roles.keys
  end
end
