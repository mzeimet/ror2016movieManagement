class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :videoType
      t.string :name
      t.boolean :seen
      t.integer :length
      t.string :cover
      t.datetime :release
      t.integer :raiting
      t.text :summary
      t.integer :ageRating
      t.text :note

      t.timestamps null: false
    end
  end
end
