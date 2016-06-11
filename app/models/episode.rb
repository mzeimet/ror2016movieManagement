class Episode < ActiveRecord::Base
  belongs_to :video
  belongs_to :season
end
