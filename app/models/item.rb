class Item < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :calories, :protein, :carbohydrates, :fat, presence: true
  validates :rating, inclusion: { in: 1..5, message: "must be between 1 and 5" }
end
