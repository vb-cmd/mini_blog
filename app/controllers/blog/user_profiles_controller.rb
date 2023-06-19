module Blog
  class UserProfilesController < ApplicationController
    def show
      @profile = User.find_by_name(params[:name])
    end
  end
end
