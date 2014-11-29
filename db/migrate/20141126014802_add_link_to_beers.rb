class AddLinkToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :link, :string
  end
end
