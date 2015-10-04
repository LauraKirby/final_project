class AddImageUrlToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :image_url, :string, default: "/images/default_user_image.png"
  end
end
