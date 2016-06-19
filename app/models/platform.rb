class Platform < ActiveRecord::Base
  belongs_to :location
  has_one :video, through: :location

  validate :borrowed_date_cannot_be_in_the_future

  def borrowed_date_cannot_be_in_the_future
    if borrowed && borrowedDate < Date.today
      errors.add(:borrowedDate, "can't be in the past")
    end
  end
end
