class AddUserIdToPhones < ActiveRecord::Migration
  def change
    add_column :phones, :user_id, :integer
    add_index :phones, :user_id
  end
end
