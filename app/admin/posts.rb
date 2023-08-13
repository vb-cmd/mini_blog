ActiveAdmin.register Post do
  permit_params :meta_title,
                :meta_description,
                :meta_keywords,
                :title,
                :published,
                :comments_enabled,
                :category_id,
                :likes_count,
                :comments_count,
                :admin_user_id

  batch_action :published do |ids|
    batch_action_collection.find(ids).each do |post|
      post.update(published: true)
    end
    redirect_to admin_posts_path, notice: 'Post(s) was published'
  end

  batch_action :not_published do |ids|
    batch_action_collection.find(ids).each do |post|
      post.update(published: false)
    end
    redirect_to admin_posts_path, notice: 'Post(s) was not published'
  end

  batch_action :comments_enabled do |ids|
    batch_action_collection.find(ids).each do |post|
      post.update(comments_enabled: true)
    end
    redirect_to admin_posts_path, notice: 'Comment(s) were enabled'
  end

  batch_action :comments_disabled do |ids|
    batch_action_collection.find(ids).each do |post|
      post.update(comments_enabled: false)
    end
    redirect_to admin_posts_path, notice: 'Comment(s) were disabled'
  end

  index do
    selectable_column
    id_column
    column :title
    column :published
    column :comments_enabled
    column :likes_count
    column :comments_count
    column :category
    column :admin_user
    column :updated_at
    column :created_at
    actions
  end

  show do |post|
    panel 'Short description' do
      post.description
    end

    panel 'Content' do
      post.body
    end

    attributes_table do
      row :meta_title
      row :meta_description
      row :meta_keywords
      row :category
      row :admin_user
      row :published
      row :comments_enabled
      row :comments_count
      row :likes_count
      row :created_at
      row :updated_at
    end
  end

  filter :title
  filter :published
  filter :comments_enabled
  filter :admin_user
  filter :category
  filter :likes_count
  filter :comments_count
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs 'Attached' do
      f.semantic_errors
      f.input :category
      f.input :admin_user
    end

    f.inputs 'Content' do
      f.semantic_errors
      f.input :title
      f.input :body
      f.input :description
      f.input :published
      f.input :comments_enabled
    end

    f.inputs 'Meta data' do
      f.semantic_errors
      f.input :meta_title
      f.input :meta_description
      f.input :meta_keywords
    end
    f.actions
  end
end
