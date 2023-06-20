module Admin
  class PostsController < BaseResource
    before_action :set_post, only: %i[show edit update destroy]

    def index
      @posts = Post.all
    end

    def comments
      @post = Post.find(params[:post_id])
      @comments = @post.comments
    end

    def show; end

    def edit; end

    def update
      if @post.update(post_params)
        redirect_to admin_post_path(@post), notice: 'Post was successfully updated.'
      else
        render 'edit', alert: 'Post was not updated.'
      end
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params_with_user)

      if @post.save
        redirect_to admin_post_path(@post), notice: 'Post was successfully created.'
      else
        render 'new', alert: 'Post was not created.'
      end
    end

    def destroy
      @post.destroy
      redirect_to admin_posts_path, notice: 'Post was successfully destroyed.'
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params[:post].permit(:title, :body, :published,
                           :description, :category_id, :comments_enabled,
                           :meta_title, :meta_description, :meta_keywords)
    end

    def post_params_with_user
      post_params.merge(user: current_user)
    end
  end
end
