class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :description

      t.timestamps
    end
  end
end
