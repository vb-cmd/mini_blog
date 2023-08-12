class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class
end

class ActionText::RichText
  def self.ransackable_attributes(_auth_object = nil)
    %w[body created_at id name record_id record_type updated_at]
  end
end
