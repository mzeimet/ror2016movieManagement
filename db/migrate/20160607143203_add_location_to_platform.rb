class AddLocationToPlatform < ActiveRecord::Migration
  def change
    add_reference :platforms, :location, index: true, foreign_key: true
  end
end
