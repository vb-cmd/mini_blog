class CommentsController < ApplicationController
  def new
    @comment = Comment.new(comment_params)
    if can_create_comment?
      if @comment.save
        render json: @comment.take_name_and_body, status: :created
      else
        render json: @comment.errors.full_messages, status: :unprocessable_entity
      end
    else
      head :forbidden
    end
  end

  private

  def can_create_comment?
    Post.find(params[:post_id]).view_comments?
  end

  def comment_params
    params.require(:comment)
          .permit(:name, :email, :body)
          .merge(post_id: params[:post_id], published: true)
  end
end
