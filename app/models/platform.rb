class Platform < ActiveRecord::Base
  belongs_to :location
  has_one :video, through: :location
end
