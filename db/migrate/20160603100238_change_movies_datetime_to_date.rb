class ChangeMoviesDatetimeToDate < ActiveRecord::Migration
  def change
    change_column :videos, :release,  :date
  end
end
