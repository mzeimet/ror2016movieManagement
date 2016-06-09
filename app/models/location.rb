class Location < ActiveRecord::Base
  belongs_to :video
  has_many :platforms
  accepts_nested_attributes_for :platforms
end
