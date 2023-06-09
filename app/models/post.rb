class Post < ApplicationRecord
  belongs_to :category
  has_many :comments

  validates :title, presence: true
  validates :body, presence: true
  validates :description, presence: true, length: { maximum: 300 }
  validates :published, inclusion: { in: [true, false] }
  validates :view_comments, inclusion: { in: [true, false] }

  paginates_per 10

  include FormatDate
  extend SelectData

  class << self
    def take_all_by_page(page)
      includes(:category)
        .where(published: true)
        .order(created_at: :desc)
        .page(page)
    end

    def find_published_by_id(id)
      includes(:category)
        .where(published: true)
        .find(id)
    end
  end
end
