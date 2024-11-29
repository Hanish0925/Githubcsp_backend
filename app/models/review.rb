class Review < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :rating, inclusion: { in: 1..5, message: "must be between 1 and 5" }
  validates :review_text, presence: true
end
