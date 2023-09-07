xml.instruct!
xml.urlset xmlns: 'http://www.sitemaps.org/schemas/sitemap/0.9' do
  urls_with_dates.each do |page|
    xml.url do
      xml.loc page[:url]
      xml.lastmod page[:date_updated]
    end
  end
end
