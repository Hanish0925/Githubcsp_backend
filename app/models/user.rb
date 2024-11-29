class User < ApplicationRecord
  # Devise modules for authentication
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :reviews, dependent: :destroy

  # Validations
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 },
                       format: { with: /\A[a-zA-Z0-9_]+\z/, message: "can only contain letters, numbers, and underscores" }
  validates :email, presence: true, uniqueness: true, length: { maximum: 255 }

  # Overwrite Devise's password validation to allow blank passwords during updates
  def password_required?
    new_record? || password.present? || password_confirmation.present?
  end
end
