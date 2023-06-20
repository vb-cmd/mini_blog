module Admin
  class CommentsController < BaseResource
    before_action :set_comment, only: %i[edit update destroy show]

    def index
      @comments = Comment.all
    end

    def show; end

    def edit; end

    def update
      if @comment.update(comment_params)
        redirect_to admin_comment_path(@comment), notice: 'Comment was successfully updated.'
      else
        render 'edit', alert: 'Comment was not updated.'
      end
    end

    def new
      @comment = Comment.new
    end

    def create
      @comment = Comment.new(comment_params)

      if @comment.save
        redirect_to admin_comment_path(@comment), notice: 'Comment was successfully created.'
      else
        render 'new', alert: 'Comment was not created.'
      end
    end

    def destroy
      @comment.destroy
      redirect_to admin_comments_path, notice: 'Comment was successfully destroyed.'
    end

    private

    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params[:comment].permit(:user_id, :body, :published, :post_id)
    end
  end
end
