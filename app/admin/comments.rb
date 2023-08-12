ActiveAdmin.register Comment do
  permit_params :body,
                :published,
                :post_id,
                :user_id

  index do
    selectable_column
    id_column
    column :user
    column :body
    column :post
    column :published
    column :created_at
    actions
  end

  filter :published
  filter :body
  filter :post
  filter :user, as: :select, collection: User.all.map { |u| [u.email, u.id] }
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs do
      f.input :body
      f.input :published
      f.input :post
      f.input :user, collection: User.all.map { |u| [u.email, u.id] }
    end

    f.actions
  end
end
