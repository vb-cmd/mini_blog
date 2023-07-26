module Admin
  class UsersController < BaseController
    before_action :set_user, only: %i[show edit update destroy]
    before_action :set_user_for_resources, only: %i[posts comments]

    def index
      @users = User.all
    end

    def edit; end

    def show; end

    def posts
      @posts = @user.posts
    end

    def comments
      @comments = @user.comments
    end

    def update
      if @user.update(user_params)
        redirect_to admin_user_path(@user), notice: 'User was successfully updated.'
      else
        render 'edit', alert: 'User was not updated.'
      end
    end

    def new
      @user = User.new
    end

    def create
      @user = User.new(user_params)

      if @user.save
        redirect_to admin_user_path(@user), notice: 'User was successfully created.'
      else
        render 'new', alert: 'User was not created.'
      end
    end

    def destroy
      @user.destroy
      redirect_to admin_users_path, notice: 'User was successfully destroyed.'
    end

    private

    def set_user
      @user = User.find(params[:id])
    end

    def set_user_for_resources
      @user = User.find(params[:user_id])
    end

    def user_params
      params[:user].permit(:email, :password, :password_confirmation,
                           :body, :avatar, :name, :role)
    end
  end
end
