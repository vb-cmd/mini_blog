class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  
  validates :body, presence: true, length: { maximum: 300 }
  validates :published, inclusion: { in: [true, false] }
end
