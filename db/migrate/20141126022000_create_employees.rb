class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :description

      t.timestamps
    end
  end
end
