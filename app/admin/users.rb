ActiveAdmin.register User do
  permit_params :email,
                :likes_count,
                :comments_count

  index do
    selectable_column
    column :email
    column :name
    column :comments_count
    column :likes_count
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :email
      row :name
      row :comments_count
      row :likes_count
      row :reset_password_token
      row :reset_password_sent_at
      row :remember_created_at
      row :created_at
      row :updated_at
    end
  end

  filter :email
  filter :name
  filter :comments_count
  filter :likes_count
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.semantic_errors
      f.input :email
      f.input :name
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
