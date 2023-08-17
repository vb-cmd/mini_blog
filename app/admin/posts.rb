ActiveAdmin.register Post do
  permit_params :meta_title,
                :meta_description,
                :meta_keywords,
                :title,
                :description,
                :body,
                :published,
                :comments_enabled,
                :category_id,
                :likes_count,
                :comments_count,
                :admin_user_id

  batch_action :publish do |ids|
    Post.where(id: ids).update_all(published: true)
    redirect_to admin_posts_path, notice: 'Post(s) was published'
  end

  batch_action :not_publish do |ids|
    Post.where(id: ids).update_all(published: false)
    redirect_to admin_posts_path, notice: 'Post(s) was not published'
  end

  batch_action :comments_enable do |ids|
    Post.where(id: ids).update_all(comments_enabled: true)
    redirect_to admin_posts_path, notice: 'Comment(s) were enabled'
  end

  batch_action :comments_disable do |ids|
    Post.where(id: ids).update_all(comments_enabled: false)
    redirect_to admin_posts_path, notice: 'Comment(s) were disabled'
  end

  index do
    selectable_column
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
    div do
      javascript_importmap_tags
    end

    f.inputs 'Attached' do
      f.semantic_errors
      f.input :category
      f.input :admin_user
    end

    f.inputs 'Settings' do
      f.semantic_errors
      f.input :title
      f.input :published
      f.input :comments_enabled
    end

    f.inputs 'Description' do
      f.semantic_errors
      li style: 'margin: 10px' do
        f.rich_text_area :description
      end
    end

    f.inputs 'Body' do
      f.semantic_errors
      li style: 'margin: 10px' do
        f.rich_text_area :body
      end
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
