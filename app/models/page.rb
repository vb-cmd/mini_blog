class Page < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :published, inclusion: { in: [true, false] }

  has_rich_text :body

  include FormatDate
  include Parameter
  extend SelectData
end
