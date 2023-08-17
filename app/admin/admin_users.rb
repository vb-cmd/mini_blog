ActiveAdmin.register AdminUser do
  permit_params :avatar,
                :email,
                :name,
                :body,
                :role,
                :posts_count,
                :pages_count,
                :password,
                :password_confirmation

  index do
    selectable_column
    column 'Avatar' do |admin_user|
      if admin_user.avatar.attached?
        image_tag admin_user.avatar, size: '50x50'
      else
        para 'No avatar'
      end
    end
    column :email
    column :name
    column :role
    column :posts_count
    column :pages_count
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  show do |admin_user|
    panel 'Avatar' do
      if admin_user.avatar.attached?
        image_tag admin_user.avatar, size: '500x500'
      else
        para 'No avatar'
      end
    end

    panel 'Content' do
      admin_user.body
    end

    attributes_table do
      row :name
      row :email
      row :role
      row :posts_count
      row :pages_count
      row :reset_password_token
      row :reset_password_sent_at
      row :sign_in_count
      row :current_sign_in_at
      row :last_sign_in_at
      row :current_sign_in_ip
      row :last_sign_in_ip
      row :created_at
      row :updated_at
    end
  end

  filter :email
  filter :name
  filter :role
  filter :posts_count
  filter :pages_count
  filter :current_sign_in_at
  filter :sign_in_count
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs do
      f.semantic_errors
      f.input :email
      f.input :name
      f.input :body
      f.input :role
      f.input :avatar, as: :file
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
