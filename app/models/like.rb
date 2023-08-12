class Like < ApplicationRecord
  belongs_to :user, counter_cache: true
  belongs_to :record, polymorphic: true, counter_cache: true

  class << self
    def ransackable_attributes(_auth_object = nil)
      %w[created_at id record_id record_type updated_at user_id]
    end

    def ransackable_associations(_auth_object = nil)
      %w[record user]
    end
  end
end
