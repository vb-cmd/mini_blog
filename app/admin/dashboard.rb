# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: I18n.t('active_admin.dashboard')

  content title: I18n.t('active_admin.dashboard') do
    panel I18n.t('admin.dashboard.last_posts.name') do
      ul do
        Post.take(10).map do |post|
          li link_to(post.title, post_path(post))
        end
      end
    end
    panel I18n.t('admin.dashboard.categories_statistics.name') do
      table_for Category.all.sort { |a, b| b.posts.count <=> a.posts.count }.take(10) do
        column(I18n.t('admin.dashboard.categories_statistics.columns.name')) do |category|
          link_to category.title, category_path(category)
        end
        column(I18n.t('admin.dashboard.categories_statistics.columns.quantity')) { |b| b.posts.count }
      end
    end
  end
end
