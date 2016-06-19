class Regisseur < ActiveRecord::Base
  has_and_belongs_to_many :videos

  mount_uploader :cover, PictureUploader

  validates :name, presence: true, length: {minimum: 6}

end
