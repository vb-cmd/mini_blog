class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  devise :database_authenticatable, :rememberable, :validatable, :recoverable, :registerable

  enum :role, %i[user moderator admin]

  validates :name, presence: true, uniqueness: true

  has_one_attached :avatar

  def self.select_name_and_ids
    self.select(:id, :name).map { |user| [user.name, user.id] }
  end
end
