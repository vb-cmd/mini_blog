module Blog
  class CommentsController < ApplicationController
    before_action do
      render_errors([t('.not_allowed')], :forbidden) unless can_create_comment?
    end

    def new
      @comment = Comment.new(comment_params)

      if @comment.save
        render_comment @comment
      else
        render_errors(@comment.errors.full_messages)
      end
    end

    private

    def can_create_comment?
      Post.find(params[:post_id]).comments_enabled?
    end

    def comment_params
      params.require(:comment)
            .permit(:name, :email, :body)
            .merge(post_id: params[:post_id], published: true)
    end

    def render_comment(comment)
      render partial: 'comment',
             locals: { comment: },
             layout: false,
             status: :created
    end

    def render_errors(errors, status = :unprocessable_entity)
      render partial: 'errors',
             locals: { errors: },
             layout: false,
             status:
    end
  end
end
