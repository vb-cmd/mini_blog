class User < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable, :recoverable, :registerable

  enum :role, %i[user moderator admin]
  validates :name, presence: true, uniqueness: true

  has_rich_text :body
  has_one_attached :avatar
  has_many :posts, dependent: :destroy

  def self.select_name_and_ids
    self.select(:id, :name).map { |user| [user.name, user.id] }
  end
end
