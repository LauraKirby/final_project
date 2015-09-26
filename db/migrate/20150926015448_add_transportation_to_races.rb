class AddTransportationToRaces < ActiveRecord::Migration
  def change
    add_column :races, :transportation, :string
  end
end
