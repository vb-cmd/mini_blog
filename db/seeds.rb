# frozen_string_literal: true

puts 'create a category'
Category.create!(title: 'Default',
                 description: 'Here your description',
                 meta_title: 'Default',
                 meta_description: 'Description category',
                 meta_keywords: 'category, meta, keywords')

puts 'create users'
%w[admin moderator user].each do |role|
    User.create!(email: "#{role}@#{role}.com",
    role: role,
    password: 'password',
    password_confirmation: 'password',
    name: role,
    body: 'Here your content',
    meta_title: 'Default',
    meta_description: 'Description category',
    meta_keywords: 'category, meta, keywords')
end

puts 'create a post'
Post.create!(category: Category.all.first,
             title: 'Hello world!',
             body: 'Here your content',
             published: true,
             description: 'Here your description',
             comments_enabled: true,
             meta_title: 'Hello world!',
             meta_description: 'Description Hello world!',
             meta_keywords: 'hello, world, description',
             user: User.all.first)

puts 'create a comment'
Comment.create!(user: User.first,
                body: 'Here your content for comment',
                published: true,
                post: Post.first)

puts 'create a page'
Page.create!(title: 'About',
             body: 'Here your content',
             published: true,
             meta_title: 'About',
             meta_description: 'Description page about',
             meta_keywords: 'abaout, meta, description')
