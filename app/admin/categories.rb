ActiveAdmin.register Category do
  permit_params :meta_title,
                :meta_description,
                :meta_keywords,
                :title,
                :posts_count

  index do
    selectable_column
    id_column
    column :title
    column :posts_count
    column :updated_at
    column :created_at
    actions
  end

  show do |category|
    panel 'Description' do
      category.description
    end

    attributes_table do
      row :meta_title
      row :meta_description
      row :meta_keywords
      row :posts_count
      row :updated_at
      row :created_at
    end
  end

  filter :title
  filter :posts_count
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs 'Content' do
      f.semantic_errors
      f.input :title
      f.input :description
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
