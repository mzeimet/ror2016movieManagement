class Location < ActiveRecord::Base
  belongs_to :video
  has_many :platforms, :dependent => :destroy
  accepts_nested_attributes_for :platforms

#  validates :description, presence: true, length: {minimum: 5}
end
