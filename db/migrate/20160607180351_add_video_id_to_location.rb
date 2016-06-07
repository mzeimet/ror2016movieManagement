class AddVideoIdToLocation < ActiveRecord::Migration
  def change
    add_reference :locations, :video, index: true, foreign_key: true
  end
end
