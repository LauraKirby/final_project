class AddImageUrlToRaces < ActiveRecord::Migration
  def change
    add_column :races, :image_url, :string
  end
end
