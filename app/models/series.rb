class Series < ActiveRecord::Base
  has_many :seasons, :dependent => :destroy

  mount_uploader :cover, PictureUploader
end
