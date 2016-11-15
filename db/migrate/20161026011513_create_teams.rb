class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.text :name, limit: 32, null: false
      t.text :captain, limit: 32
      t.integer :score
      t.timestamps
    end
    add_index :teams, :name, unique: true
  end
end
