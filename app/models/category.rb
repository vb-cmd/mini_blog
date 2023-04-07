class Category < ApplicationRecord
  has_many :posts
  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 300 }

  include FormatDate
  extend SelectData
end
