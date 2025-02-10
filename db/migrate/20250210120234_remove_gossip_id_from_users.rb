class RemoveGossipIdFromUsers < ActiveRecord::Migration[8.0]
  def change
    remove_column :users, :gossip_id, :integer
  end
end
