module Blog
  class AuthorsController < BaseController
    def show
      @author = AdminUser.find_by_name(params[:id])
    end
  end
end
