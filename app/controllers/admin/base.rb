module Admin
  class Base < ApplicationController
    layout 'admin'

    before_action :authenticate_admin_user!

    alias current_user current_admin_user
  end
end
