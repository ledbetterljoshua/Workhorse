class AddUrlToJukeboxes < ActiveRecord::Migration
  def change
    add_column :jukeboxes, :url, :string
  end
end
