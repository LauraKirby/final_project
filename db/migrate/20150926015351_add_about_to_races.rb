class AddAboutToRaces < ActiveRecord::Migration
  def change
    add_column :races, :about, :string
  end
end
