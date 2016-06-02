class CreateRegisseurs < ActiveRecord::Migration
  def change
    create_table :regisseurs do |t|
      t.string :name
      t.string :cover

      t.timestamps null: false
    end
  end
end
