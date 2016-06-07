class AddLocationIdToVideo < ActiveRecord::Migration
  def change
    add_reference :videos, :location, index: true, foreign_key: true
  end
end
