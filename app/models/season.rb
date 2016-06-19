class Season < ActiveRecord::Base
  has_many :episodes, :dependent => :destroy
  belongs_to :series

  mount_uploader :cover, PictureUploader

  validates :number, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100},
   uniqueness: {scope: :series_id}

end
