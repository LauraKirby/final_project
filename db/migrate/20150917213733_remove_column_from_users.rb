class RemoveColumnFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :fitbit_id, :string
  end
end
