module Blog
  class SitemapController < ApplicationController
    def index
      @url_and_date = [hash_home]
                      .concat(hash_pages)
                      .concat(hash_categories)
                      .concat(hash_posts)
    end

    private

    def hash_url_and_updated(url, date_updated)
      { url:, date_updated: }
    end

    def hash_home
      hash_url_and_updated(home_url, DateTime.now.strftime('%d/%m/%Y'))
    end

    def hash_pages
      Page.all.map { |page| hash_url_and_updated page_url(page), page.date_updated }
    end

    def hash_categories
      Category.all.map { |category| hash_url_and_updated category_url(category), category.date_updated }
    end

    def hash_posts
      Post.all.map { |post| hash_url_and_updated post_url(post), post.date_updated }
    end
  end
end
