ActiveAdmin.register Category do
  permit_params :meta_title,
                :meta_description,
                :meta_keywords,
                :description,
                :title,
                :posts_count

  index do
    selectable_column
    column :title
    column :posts_count
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
    div do
      javascript_importmap_tags
    end
    f.inputs 'Content' do
      f.semantic_errors
      f.input :title
    end

    f.inputs 'Body' do
      f.semantic_errors
      li style: 'margin: 10px;' do
        f.rich_text_area :description
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
