class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.text :description
      t.string :email
      t.integer :age
      t.belongs_to :city, index: true
      t.belongs_to :gossip, index: true
      

      t.timestamps
    end
  end
end
 