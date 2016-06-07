class CreateJoinTableGenreVideo < ActiveRecord::Migration
  def change
    create_join_table :genres, :videos do |t|
      # t.index [:genre_id, :video_id]
      # t.index [:video_id, :genre_id]
    end
  end
end
