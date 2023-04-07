class SearchController < ApplicationController
  def index
    @query = Post.all.ransack(params[:query])
    @posts = @query.result(distinct: true).page(params[:page])
  end
end
