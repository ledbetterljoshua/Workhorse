class CreateFacts < ActiveRecord::Migration
  def change
    create_table :facts do |t|
      t.string :hours
      t.text :pets
      t.text :happyhour
      t.text :fullbar
      t.string :bikeracks
      t.text :music
      t.text :games
      t.string :wifi
      t.string :reservations
      t.string :smoking
      t.string :parking
      t.text :whattoexpect

      t.timestamps
    end
  end
end
