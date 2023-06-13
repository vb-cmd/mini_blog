module Admin
  class Base < ApplicationController
    before_action :authenticate_admin_user!
    layout 'admin'
  end
end
