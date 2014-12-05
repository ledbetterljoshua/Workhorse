class AddBandToJukeboxes < ActiveRecord::Migration
  def change
    add_column :jukeboxes, :band, :string
  end
end
