ActiveAdmin.register Page do
  permit_params :meta_title,
                :meta_description,
                :meta_keywords,
                :title,
                :body,
                :published

  index do
    selectable_column
    id_column
    column :title
    column :admin_user
    column :published
    column :updated_at
    column :created_at
    actions
  end

  show do |page|
    panel 'Content' do
      page.body
    end

    attributes_table do
      row :meta_title
      row :meta_description
      row :meta_keywords
      row :admin_user
      row :published
      row :created_at
      row :updated_at
    end
  end

  filter :title
  filter :published
  filter :admin_user
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :published
      h2 'Meta data: ', style: 'margin:10px;'
      f.input :meta_title
      f.input :meta_description
      f.input :meta_keywords
    end
    f.actions
  end
end
