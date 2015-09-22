class AddImageUrlToRaces < ActiveRecord::Migration
  def change
    add_column :races, :image_url, :string, default: "placeholder_image.png"
  end
end
