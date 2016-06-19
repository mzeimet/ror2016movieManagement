class Episode < ActiveRecord::Base
  belongs_to :video, validate:true
  belongs_to :season

  validates :episodeNumber, presence: true, numericality: {greater_than_or_equal_to: 0, less_than_or_equal_to: 100},
   uniqueness: {scope: :season_id}

end
