module Admin
  class PostsController < BaseResource
    before_action :set_post, only: %i[show edit update destroy]
    before_action :set_categories, only: %i[new edit]

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
        redirect_to post_path(@post)
      else
        redirect_to edit_admin_post_path(@post)
      end
    end

    def new
      @post = Post.new
    end

    def create
      @post = Post.new(post_params.merge(admin_user: current_admin_user))

      if @post.save
        redirect_to post_path(@post)
      else
        redirect_to new_admin_post_path
      end
    end

    def destroy
      @post.destroy
      redirect_to admin_posts_path
    end

    private

    def set_post
      @post = Post.find(params[:id])
    end

    def set_categories
      @categories = Category.select_title_and_ids
    end

    def post_params
      params[:post].permit(:title, :body, :published,
                           :description, :category_id, :comments_enabled,
                           :meta_title, :meta_description, :meta_keywords)
    end
  end
end
