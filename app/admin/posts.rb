ActiveAdmin.register Post do
  permit_params :title, :body, :category, :description, :published

  index do
    selectable_column
    id_column
    column :title
    column :body
    column :description
    column :category
    column :published
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :body
  filter :description
  filter :category, as: :select, collection: Category.all
  filter :published
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      h2 'Content:'
      f.input :title
      f.input :body
      f.input :description
      f.input :category, as: :select, collection: Category.all
      f.input :published
      f.input :created_at
      f.input :updated_at

      h2 'Meta:'
      f.input :meta_title
      f.input :meta_description
      f.input :meta_keywords
    end
    f.actions
  end
end
