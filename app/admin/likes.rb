ActiveAdmin.register Like do
  permit_params :user_id, :record_type, :record_id

  index do
    selectable_column
    column :user
    column :record
    column :created_at
    actions
  end

  filter :user, collection: User.all.map { |u| [u.email, u.id] }
  filter :record_type
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.semantic_errors
      f.input :user, collection: User.all.map { |u| [u.email, u.id] }
      f.input :record_type, as: :hidden, input_html: { value: 'Post' }
      f.input :record, collection: Post.all.map { |u| [u.title, u.id] }
    end
    f.actions
  end
end
