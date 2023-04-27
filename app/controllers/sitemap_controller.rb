class SitemapController < ApplicationController
  def index
    @pages = Page.select_only_updated_and_id
    @categories = Category.select_only_updated_and_id
    @posts = Post.select_only_updated_and_id
  end
end
