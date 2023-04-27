ActiveAdmin.register Comment, as: 'PostComments' do
  permit_params :name, :email, :body, :published, :post_id
end
