module Blog
  class PostsController < BaseController
    def index
      @posts = Post.take_all_by_page(params[:page])
    end

    def show
      @post = Post.find_published_by_id(params[:id])
      @comments = @post.comments.where(published: true)
    end
  end
end
