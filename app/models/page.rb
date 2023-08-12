class Page < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :published, inclusion: { in: [true, false] }

  belongs_to :admin_user, counter_cache: true

  has_rich_text :body

  include FormatDate
  include Parameter
  extend SelectData

  class << self
    def ransackable_attributes(_auth_object = nil)
      %w[admin_user_id created_at id meta_description meta_keywords meta_title published title updated_at]
    end

    def ransackable_associations(_auth_object = nil)
      %w[admin_user rich_text_body]
    end
  end
end
