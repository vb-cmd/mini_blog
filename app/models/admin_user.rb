class AdminUser < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable, :recoverable
  validates :name, presence: true, uniqueness: true
  has_rich_text :body
  has_one_attached :avatar
  has_many :posts, dependent: :destroy
end
