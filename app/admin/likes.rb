ActiveAdmin.register Like do
  permit_params :user_id, :record_type, :record_id

  index do
    selectable_column
    id_column
    column :user
    column :record
    column :created_at
    actions
  end

  # filter :user, as: :select, collection: User.all.map { |u| [u.email, u.id] }
  filter :record_type
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.semantic_errors
      f.input :user, collection: User.all.map { |u| [u.email, u.id] }
      f.input :record, collection: Post.all
    end
    f.actions
  end
end
