class AddAboutUrlToRaces < ActiveRecord::Migration
  def change
    add_column :races, :about_url, :string
  end
end
