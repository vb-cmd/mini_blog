class Comment < ApplicationRecord
  belongs_to :post, counter_cache: true
  belongs_to :user, counter_cache: true

  validates :body, presence: true, length: { maximum: 300 }
  validates :published, inclusion: { in: [true, false] }

  class << self
    def ransackable_attributes(_auth_object = nil)
      %w[body created_at id post_id published updated_at user_id]
    end

    def ransackable_associations(_auth_object = nil)
      %w[post user]
    end
  end
end
