class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|
      t.text :name, limit: 32, null: false

      t.timestamps
    end
    add_index :teams, :name, unique: true
  end
end