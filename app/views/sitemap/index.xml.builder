xml.instruct!
xml.urlset xmlns: "http://www.sitemaps.org/schemas/sitemap/0.9" do
  @pages.each do |page|
    render partial: 'url', locals: { url:home_url, date_updated: DateTime.now.strftime('%d/%m/%Y'), builder: xml}
  end
  @categories.each do |category|
    render partial: 'url', locals: { url:category_url(category), date_updated:category.date_updated, builder: xml }
  end
  @posts.each do |post|
    render partial: 'url', locals: { url:post_url(post), date_updated:post.date_updated, builder: xml }
  end
end