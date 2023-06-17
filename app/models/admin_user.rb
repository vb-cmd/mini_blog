class AdminUser < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable, :recoverable, :registerable

  enum :role, %i[user moderator admin]
  validates :name, presence: true, uniqueness: true

  has_rich_text :body
  has_one_attached :avatar
  has_many :posts, dependent: :destroy
end
