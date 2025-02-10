class CreateTagGossips < ActiveRecord::Migration[8.0]
  def change
    create_table :tag_gossips do |t|
      t.timestamps
      t.belongs_to :tag
      t.belongs_to :gossips
    end
  end
end
