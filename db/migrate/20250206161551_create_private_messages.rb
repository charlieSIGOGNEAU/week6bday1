class CreatePrivateMessages < ActiveRecord::Migration[8.0]
  def change
    create_table :private_messages do |t|
      t.text :content
      t.belongs_to :sender, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
