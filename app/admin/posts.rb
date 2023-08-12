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
    f.inputs do
      f.input :title
      f.input :body
      f.input :description
      f.input :published
      f.input :comments_enabled
      f.input :category
      f.input :admin_user
      h2 'Meta data: ', style: 'margin:10px;'
      f.input :meta_title
      f.input :meta_description
      f.input :meta_keywords
    end
    f.actions
  end
end
