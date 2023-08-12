class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  devise :database_authenticatable, :rememberable, :validatable, :recoverable, :registerable

  class << self
    def ransackable_attributes(_auth_object = nil)
      %w[created_at email encrypted_password id likes_count comments_count remember_created_at reset_password_sent_at reset_password_token updated_at]
    end

    def ransackable_associations(_auth_object = nil)
      %w[comments likes]
    end
  end
end
