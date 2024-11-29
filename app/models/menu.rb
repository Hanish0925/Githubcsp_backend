class Menu < ApplicationRecord
  # Ensure week_start_date is present and unique (no duplicate menus for the same week)
  validates :week_start_date, presence: true, uniqueness: true
  
  # Ensure breakfast_items, lunch_items, and dinner_items are present
  validates :breakfast_items, presence: { message: "must be provided" }
  validates :lunch_items, presence: { message: "must be provided" }
  validates :dinner_items, presence: { message: "must be provided" }

  # Example: Custom validation to ensure week_start_date is not in the past
  validate :week_start_date_cannot_be_in_the_past

  private

  # Custom validation to ensure the week_start_date is not in the past
  def week_start_date_cannot_be_in_the_past
    if week_start_date.present? && week_start_date < Date.today
      errors.add(:week_start_date, "can't be in the past")
    end
  end
end
