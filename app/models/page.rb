class Page < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :published, inclusion: { in: [true, false] }
  
  include FormatDate
  extend SelectData

  def to_param
    "#{id}-#{title.parameterize}"
  end
end
