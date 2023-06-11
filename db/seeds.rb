# frozen_string_literal: true

puts 'create a category'
Category.create(title: 'Default',
                description: 'Here your description',
                meta_title: 'Default',
                meta_description: 'Description category',
                meta_keywords: 'category, meta, keywords')

puts 'create a post'
Post.create(category: Category.all.first,
            title: 'Hello world!',
            body: 'Here your content',
            published: true,
            description: 'Here your description',
            meta_title: 'Hello world!',
            meta_description: 'Description Hello world!',
            meta_keywords: 'hello, world, description')

puts 'create a comment'
Comment.create(name: 'Hello World',
               email: '4p5Q6@example.com',
               body: 'Here your content for comment',
               published: true,
               post: Post.all.first)

puts 'create a page'
Page.create(title: 'About',
            body: 'Here your content',
            published: true,
            meta_title: 'About',
            meta_description: 'Description page about',
            meta_keywords: 'abaout, meta, description')

puts 'create an admin account'
AdminUser.create!(email: 'admin@admin.com',
                  password: 'password',
                  password_confirmation: 'password')
