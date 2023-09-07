module Blog::SitemapHelper
  def urls_with_dates
    [hash_home].concat(hash_pages, hash_categories, hash_posts)
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
