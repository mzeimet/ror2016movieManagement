class Series < ActiveRecord::Base
  has_many :seasons, :dependent => :destroy
  has_many :episodes, through: :seasons
  mount_uploader :cover, PictureUploader
end
