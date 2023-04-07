# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# create 3 categories
3.times do |i|
  Category.create(title: "Test category #{i}", description: 'description',
                  meta_title: 'meta_title', meta_description: 'meta_description', meta_keywords: 'meta_keywords')
end

# take all categories
list_categories = Category.all

# create 15 posts
15.times do |i|
  Post.create(category: list_categories[rand(list_categories.count)], title: "Title #{i}", body: "Body #{i}",
              published: true, description: 'description',
              meta_title: 'meta_title', meta_description: 'meta_description', meta_keywords: 'meta_keywords')
end

# create a negative post
Post.create(category: list_categories[rand(list_categories.count)], title: 'Title', body: 'Body',
            published: false, description: 'description',
            meta_title: 'meta_title', meta_description: 'meta_description', meta_keywords: 'meta_keywords')

# create 3 pages
3.times do |i|
  Page.create(title: "Title page #{i}", body: "Content page #{i}", published: true,
              meta_title: 'meta_title', meta_description: 'meta_description', meta_keywords: 'meta_keywords')
end

# create a negative page
Page.create(title: 'Title page', body: 'Content page', published: false,
            meta_title: 'meta_title', meta_description: 'meta_description', meta_keywords: 'meta_keywords')

# create an admin account
AdminUser.create!(email: 'admin@admin.com', password: 'password', password_confirmation: 'password')
