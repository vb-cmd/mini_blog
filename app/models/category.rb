class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true

  has_rich_text :description

  include FormatDate
  include Parameter
  extend SelectData
end
