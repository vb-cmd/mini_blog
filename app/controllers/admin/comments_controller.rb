module Admin
  class CommentsController < BaseResource
    before_action :set_comment, only: %i[edit update destroy show]
    before_action :set_posts, only: %i[new edit]

    def index
      @comments = Comment.all
    end

    def show; end

    def edit; end

    def update
      if @comment.update(comment_params)
        redirect_to admin_comment_path(@comment)
      else
        redirect_to new_admin_comment_path
      end
    end

    def new
      @comment = Comment.new
    end

    def create
      @comment = Comment.new(comment_params)

      if @comment.save
        redirect_to admin_comment_path(@comment)
      else
        redirect_to new_admin_comment_path
      end
    end

    def destroy
      @comment.destroy
      redirect_to admin_comments_path
    end

    private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_posts
      @posts = Post.select_title_and_ids
    end

    def comment_params
      params[:comment].permit(:name, :email, :body, :published, :post_id)
    end
  end
end
