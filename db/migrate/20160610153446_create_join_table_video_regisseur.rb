class CreateJoinTableVideoRegisseur < ActiveRecord::Migration
  def change
    create_join_table :videos, :regisseurs do |t|
      # t.index [:video_id, :regisseur_id]
      # t.index [:regisseur_id, :video_id]
    end
  end
end
