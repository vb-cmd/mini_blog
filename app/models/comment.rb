class Comment < ApplicationRecord
  belongs_to :post

  validates :name, presence: true, length: { maximum: 10 }
  validates :email, presence: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :body, presence: true, length: { maximum: 300 }
  validates :published, inclusion: { in: [true, false] }

  def take_name_and_body_hash
    {
      name:,
      body:
    }
  end
end
