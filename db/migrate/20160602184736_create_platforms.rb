class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|
      t.string :name
      t.boolean :borrowed
      t.datetime :borrowedDate

      t.timestamps null: false
    end
  end
end
