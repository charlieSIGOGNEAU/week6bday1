class CreateComments < ActiveRecord::Migration[8.0]
  def change
    create_table :comments do |t|
      t.text :content
      t.belongs_to :gossip

      t.timestamps
    end
  end
end
