class Season < ActiveRecord::Base
  has_many :episodes, :dependent => :destroy 
  belongs_to :series

  mount_uploader :cover, PictureUploader
end
