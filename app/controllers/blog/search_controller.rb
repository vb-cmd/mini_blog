module Blog
  class SearchController < BaseController
    def index
      @query = Post.where(published: true).ransack(params[:query])
      @posts = @query.result(distinct: true).page(params[:page])
    end
  end
end
