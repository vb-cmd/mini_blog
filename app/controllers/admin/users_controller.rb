module Admin
  class UsersController < BaseResource
    before_action :set_user, only: %i[show edit update destroy]
    before_action :set_user_roles, only: %i[edit new]

    def index
      @users = User.all
    end

    def edit; end

    def show; end

    def posts
      @user = User.find(params[:user_id])
      @posts = @user.posts
    end

    def update
      if @user.update(edit_user_params)
        redirect_to admin_user_path(@user)
      else
        redirect_to edit_admin_user_path(@user)
      end
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(new_user_params)

      if @user.save
        redirect_to admin_user_path(@user)
      else
        redirect_to new_admin_user_path
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def set_user_roles
      @roles = User.roles.keys
    end

    def new_user_params
      params[:user].permit(:email, :password, :password_confirmation,
                           :body, :avatar, :name, :role,
                           :meta_title, :meta_description, :meta_keywords)
    end

    def edit_user_params
      params[:user].permit(:email, :body, :avatar, :name, :role,
                           :meta_title, :meta_description, :meta_keywords)
    end
  end
end
