class SitemapController < ApplicationController
  def index
    @sitemaps = [sitemap_posts_url, sitemap_categories_url]
  end

  def posts
    @posts = Post.select_only_updated_and_id
  end

  def pages
    @pages = Page.select_only_updated_and_id
  end

  def categories
    @categories = Category.select_only_updated_and_id
  end
end
