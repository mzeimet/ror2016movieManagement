class ChangeVideoVideoTypeType < ActiveRecord::Migration
  def self.up
    change_column :videos, :videoType, :integer
  end
  def self.down
    change_column :videos, :videoType, :string
  end
end
