class CommentsController < ApplicationController
  def new
    @comment = Comment.new(comment_params)
    if can_create_comment? && @comment.save
      flash[:notice] = t('.created')
    else
      flash[:alert] = t('.not_created')
    end

    redirect_to post_path(params[:post_id])
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
