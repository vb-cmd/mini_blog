module Admin
  class AdminUsersController < BaseResource
    before_action :set_admin_user, only: %i[show edit update destroy]
    before_action :set_roles, only: %i[edit new]

    def index
      @admin_users = AdminUser.all
    end

    def edit; end

    def show; end

    def posts
      @admin_user = AdminUser.find(params[:admin_user_id])
      @posts = @admin_user.posts
    end

    def update
      if @admin_user.update(edit_admin_user_params)
        redirect_to admin_admin_user_path(@admin_user)
      else
        redirect_to edit_admin_admin_user_path(@admin_user)
      end
    end

    def new
      @admin_user = AdminUser.new
    end

    def create
      @admin_user = AdminUser.new(new_admin_user_params)

      if @admin_user.save
        redirect_to admin_admin_user_path(@admin_user)
      else
        redirect_to new_admin_admin_user_path
      end
    end

    def destroy
      @admin_user.destroy
      redirect_to admin_admin_users_path
    end

    private

    def set_admin_user
      @admin_user = AdminUser.find(params[:id])
    end

    def set_roles
      @roles = AdminUser.roles.keys
    end

    def new_admin_user_params
      params[:admin_user].permit(:email, :password, :password_confirmation,
                                 :body, :avatar, :name, :role,
                                 :meta_title, :meta_description, :meta_keywords)
    end

    def edit_admin_user_params
      params[:admin_user].permit(:email, :body, :avatar, :name, :role,
                                 :meta_title, :meta_description, :meta_keywords)
    end
  end
end
