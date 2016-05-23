class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.text :name
      t.integer :seen
      t.integer :lenght
      t.text :relasedate
      t.integer :rating
      t.text :description

      t.timestamps null: false
    end
  end
end
