class Category < ApplicationRecord
  has_many :posts, dependent: :destroy

  validates :title, presence: true

  has_rich_text :description

  include FormatDate
  include Parameter
  extend SelectData

  class << self
    def ransackable_attributes(_auth_object = nil)
      %w[created_at id meta_description posts_count meta_keywords meta_title title updated_at]
    end

    def ransackable_associations(_auth_object = nil)
      %w[posts rich_text_description]
    end
  end
end
