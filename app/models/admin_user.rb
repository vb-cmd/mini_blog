class AdminUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :validatable, :trackable

  has_many :posts, dependent: :destroy
  has_many :pages, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :body, presence: true

  has_one_attached :avatar

  class << self
    def ransackable_attributes(_auth_object = nil)
      %w[body created_at email sign_in_count encrypted_password id posts_count pages_count name remember_created_at reset_password_sent_at reset_password_token updated_at]
    end

    def ransackable_associations(_auth_object = nil)
      %w[avatar_attachment avatar_blob pages posts]
    end
  end
end
