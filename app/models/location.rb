class Location < ActiveRecord::Base
  belongs_to :video
  has_many :platforms
end
