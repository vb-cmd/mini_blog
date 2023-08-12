module Blog
  class UserProfilesController < BaseController
    def show
      @profile = AdminUser.find_by_name(params[:id])
    end
  end
end
