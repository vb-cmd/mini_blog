class Page < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :published, inclusion: { in: [true, false] }
  
  include FormatDate
  include Parameter
  extend SelectData
end
