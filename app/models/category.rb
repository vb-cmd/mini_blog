class Category < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :title, presence: true
  validates :description, presence: true, length: { maximum: 300 }

  include FormatDate
  include Parameter
  extend SelectData
end
