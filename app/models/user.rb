class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :rememberable,
         :validatable,
         :recoverable,
         :registerable

  validates :name, presence: true

  class << self
    def ransackable_attributes(_auth_object = nil)
      %w[created_at email name id likes_count comments_count remember_created_at reset_password_sent_at reset_password_token updated_at]
    end

    def ransackable_associations(_auth_object = nil)
      %w[comments likes]
    end
  end
end
