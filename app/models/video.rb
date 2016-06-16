class Video < ActiveRecord::Base
#  has_and_belongs_to_many :regisseurs
  has_and_belongs_to_many :actors
  has_and_belongs_to_many :genres
  has_and_belongs_to_many :regisseurs
  has_many :platforms, through: :location
  has_many :episodes
  has_one :location

  accepts_nested_attributes_for :location, allow_destroy:true
  accepts_nested_attributes_for :platforms
  accepts_nested_attributes_for :episodes

  mount_uploader :cover, PictureUploader

end
