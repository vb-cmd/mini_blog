class Post < ApplicationRecord
  belongs_to :category, counter_cache: true
  belongs_to :admin_user, counter_cache: true

  has_many :comments, dependent: :destroy
  has_many :likes, as: :record, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true
  validates :description, presence: true
  validates :published, inclusion: { in: [true, false] }
  validates :comments_enabled, inclusion: { in: [true, false] }

  has_rich_text :description
  has_rich_text :body

  paginates_per 10

  include FormatDate
  include Parameter

  class << self
    def ransackable_attributes(_auth_object = nil)
      %w[admin_user_id category_id comments_enabled created_at id likes_count comments_count meta_description meta_keywords meta_title published title updated_at]
    end

    def ransackable_associations(_auth_object = nil)
      %w[admin_user category comments likes rich_text_body rich_text_description]
    end

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

  def take_published_comments
    comments.where(published: true)
  end

  def liked_by?(user)
    likes.where(user:).any?
  end

  def unlike(user)
    likes.where(user:).destroy_all
  end

  def like(user)
    likes.where(user:).first_or_create
  end
end
