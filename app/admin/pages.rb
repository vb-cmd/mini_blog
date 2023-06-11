ActiveAdmin.register Page do
  permit_params :title, :body, :published

  index do
    selectable_column
    column :title
    column :published
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :body
  filter :published
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :title
      f.input :body
      f.input :published
      f.input :created_at
      f.input :updated_at

      h2 'Meta Tags Data: ', style: 'padding-left:10px;'
      f.input :meta_title
      f.input :meta_description
      f.input :meta_keywords
    end
    f.actions
  end
end
