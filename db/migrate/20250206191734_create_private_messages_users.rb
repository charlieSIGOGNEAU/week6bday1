class CreatePrivateMessagesUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :private_messages_users do |t|
      t.references :private_message, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
