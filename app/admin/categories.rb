ActiveAdmin.register Category do
  permit_params :title, :description

  index do
    selectable_column
    column :title
    column :description
    column 'Quantity', ->(category) { category.posts.count }
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :description
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      h2 'Content:', style: 'padding-left:10px;'
      f.input :title
      f.input :description
      f.input :created_at
      f.input :updated_at
      h2 'Meta:', style: 'padding-left:10px;'
      f.input :meta_title
      f.input :meta_description
      f.input :meta_keywords
    end
    f.actions
  end
end
