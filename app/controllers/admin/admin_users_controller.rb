module Admin
  class AdminUsersController < Base
    def index
      @admin_users = AdminUser.all
    end

    def edit; end

    def show; end

    def update
      if current_admin_user.update(edit_admin_user_params)
        redirect_to profile_path(current_admin_user.name)
      else
        redirect_to edit_admin_admin_user_path
      end
    end

    def new
      @admin_user = AdminUser.new
    end

    def create
      @admin_user = AdminUser.new(new_admin_user_params)

      if @admin_user.save
        redirect_to admin_admin_users_path(@admin_user)
      else
        redirect_to new_admin_admin_user_path
      end
    end

    def destroy
      current_admin_user.destroy
      redirect_to home_path
    end

    private

    def new_admin_user_params
      params[:admin_user].permit(:email, :password, :password_confirmation,
                                 :body, :avatar, :name,
                                 :meta_title, :meta_description, :meta_keywords)
    end

    def edit_admin_user_params
      params[:admin_user].permit(:email, :body, :avatar, :name,
                                 :meta_title, :meta_description, :meta_keywords)
    end
  end
end
