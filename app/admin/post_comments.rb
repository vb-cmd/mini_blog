ActiveAdmin.register Comment, as: 'PostComments' do
  permit_params :name, :email, :body, :published, :post_id

  
  index do
    selectable_column
    column :name
    column :email
    column :body
    column :published
    column :post
    actions
  end


  filter :name
  filter :email
  filter :body
  filter :published
  filter :created_at
  filter :updated_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :email
      f.input :body
      f.input :post, as: :select, collection: Post.all
      f.input :published
      f.input :created_at
      f.input :updated_at
    end
    f.actions
  end
end
