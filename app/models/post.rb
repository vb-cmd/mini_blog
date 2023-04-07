class Post < ApplicationRecord
  belongs_to :category

  validates :title, presence: true
  validates :body, presence: true
  validates :category, presence: true
  validates :description, presence: true, length: { maximum: 300 }

  paginates_per 10

  include FormatDate
  extend SelectData

  def self.take_posts_by_page(page)
    includes(:category)
      .where(published: true)
      .order(created_at: :desc)
      .page(page)
  end

  def self.take_post_by_id(id)
    includes(:category)
      .where(published: true)
      .find(id)
  end
end
