class AddUserIdToLogos < ActiveRecord::Migration
  def change
    add_column :logos, :user_id, :integer
    add_index :logos, :user_id
  end
end
