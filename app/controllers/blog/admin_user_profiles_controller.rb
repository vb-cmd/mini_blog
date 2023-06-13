module Blog
  class AdminUserProfilesController < ApplicationController
    def show
      @profile = AdminUser.find_by_name(params[:name])
    end
  end
end
