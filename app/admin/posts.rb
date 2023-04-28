ActiveAdmin.register Post do
  permit_params :title, :body, :category_id, :description, :published, :view_comments

  index do
    selectable_column
    id_column
    column :title
    column :category
    column :published
    column :view_comments
    column :created_at
    column :updated_at
    actions
  end

  filter :title
  filter :body
  filter :description
  filter :category, as: :select, collection: Category.all
  filter :published
  filter :view_comments
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      h2 'Content: ', style: 'padding-left:10px;'
      f.input :title
      f.input :body
      f.input :description
      f.input :category, as: :select, collection: Category.all
      f.input :published
      f.input :view_comments
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
