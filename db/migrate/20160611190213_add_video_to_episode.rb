class AddVideoToEpisode < ActiveRecord::Migration
  def change
    add_reference :episodes, :video, index: true, foreign_key: true
  end
end
