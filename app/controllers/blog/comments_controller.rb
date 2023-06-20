module Blog
  class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :render_not_allowed, unless: :can_create_comment?

    def create
      @comment = Comment.new(comment_params)

      if @comment.save
        render_without_layout('messages', :created, messages: [t('.success')])
      else
        render_without_layout('messages', :unprocessable_entity, messages: [t('.errors')])
      end
    end

    private

    def render_not_allowed
      render_without_layout('messages', :forbidden, messages: [t('.not_allowed')])
    end

    def can_create_comment?
      Post.find(params[:post_id]).comments_enabled?
    end

    def comment_params
      params.require(:comment)
            .permit(:body)
            .merge(post: Post.find(params[:post_id]), user: current_user)
    end

    def render_without_layout(partial, status, **locals)
      render partial:,
             locals:,
             layout: false,
             status:
    end
  end
end
