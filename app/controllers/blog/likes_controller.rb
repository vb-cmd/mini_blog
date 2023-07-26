class Blog::LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def update
    if @post.liked_by? current_user
      @post.unlike(current_user)
    else
      @post.like(current_user)
    end
    render partial: 'update', layout: false
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
