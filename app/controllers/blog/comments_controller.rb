module Blog
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :comments_are_not_allowed, unless: :can_create_comment?

    def new
      @comment = Comment.new(comment_params)

      if @comment.save
        render_comment @comment
      else
        render_errors(@comment.errors.full_messages)
      end
    end

    private

    def comments_are_not_allowed
      render_errors([t('.not_allowed')], :forbidden)
    end

    def can_create_comment?
      Post.find(params[:post_id]).comments_enabled?
    end

    def comment_params
      params.require(:comment)
            .permit(:body)
            .merge(post_id: params[:post_id], user: current_user)
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
