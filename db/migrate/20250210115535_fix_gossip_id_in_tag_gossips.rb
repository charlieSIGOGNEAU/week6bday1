class FixGossipIdInTagGossips < ActiveRecord::Migration[8.0]
  def change
    rename_column :tag_gossips, :gossips_id, :gossip_id
  end
end
