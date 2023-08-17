# frozen_string_literal: true

require 'faker'

puts 'Destroy all records in database'
[User, AdminUser, Category, Post, Comment, Page, Like].each(&:destroy_all)

def development
  puts 'Create categories'
  10.times do
    Category.create!(title: Faker::Lorem.sentence,
                     description: Faker::Lorem.paragraph,
                     meta_title: Faker::Lorem.sentence[0..50],
                     meta_description: Faker::Lorem.paragraph[0..200],
                     meta_keywords: Faker::Lorem.sentence.split.map(&:downcase).join(','))
  end

  puts 'Create users'
  10.times do
    User.create!(email: Faker::Internet.email,
                 password: 'password',
                 password_confirmation: 'password',
                 name: Faker::Name.name)
  end

  puts 'Create admin users'
  %w[administrator moderator].each do |role|
    AdminUser.create!(email: "#{role}@#{role}.com",
                      password: 'password',
                      password_confirmation: 'password',
                      role:,
                      name: role,
                      body: role)
  end

  puts 'Create posts'
  10.times do
    Post.create!(category: Category.all.sample,
                 title: Faker::Lorem.sentence,
                 body: Faker::Lorem.paragraph,
                 published: Faker::Boolean.boolean,
                 description: Faker::Lorem.paragraph,
                 comments_enabled: Faker::Boolean.boolean,
                 meta_title: Faker::Lorem.sentence[0..50],
                 meta_description: Faker::Lorem.paragraph[0..200],
                 meta_keywords: Faker::Lorem.sentence.split.map(&:downcase).join(','),
                 admin_user: AdminUser.all.sample)
  end

  puts 'Create comments for posts'
  10.times do
    Comment.create!(user: User.all.sample,
                    body: Faker::Lorem.paragraph,
                    published: Faker::Boolean.boolean,
                    post: Post.all.sample)
  end

  puts 'Create pages'
  10.times do
    Page.create!(title: Faker::Lorem.sentence,
                 body: Faker::Lorem.paragraph,
                 published: Faker::Boolean.boolean,
                 meta_title: Faker::Lorem.sentence[0..50],
                 meta_description: Faker::Lorem.paragraph[0..200],
                 meta_keywords: Faker::Lorem.sentence.split.map(&:downcase).join(','),
                 admin_user: AdminUser.all.sample)
  end

  puts 'Create likes for posts'
  30.times do
    Like.create!(user: User.all.sample,
                 record: Post.all.sample)
  end
end

def production
  puts 'Create an admin user'
  admin = 'administrator'
  AdminUser.create!(email: "#{admin}@#{admin}.com",
                    password: 'password',
                    password_confirmation: 'password',
                    name: admin,
                    body: admin,
                    role: admin)

  puts 'Create a category'
  default = 'Default'
  Category.create!(title: default,
                   description: default + ' description',
                   meta_title: default,
                   meta_description: default,
                   meta_keywords: 'default, default description, description')

  puts 'Create a post'
  hello = 'Hello world'
  Post.create!(category: Category.all.sample,
               title: hello,
               body: hello,
               description: hello,
               meta_title: hello,
               meta_description: hello,
               meta_keywords: 'hello, hello world, world',
               published: true,
               comments_enabled: true,
               admin_user: AdminUser.all.sample)
               
  puts 'Create a page'
  title = 'Page'
  Page.create!(title:,
               body: title,
               meta_title: title,
               meta_description: title,
               meta_keywords: 'page, page keywords, keywords',
               published: true,
               admin_user: AdminUser.all.sample)
end

case Rails.env
when 'development'
  development
when 'production'
  production
end
