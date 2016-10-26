class CreateReferees < ActiveRecord::Migration[5.0]
  def change
    create_table :referees do |t|
      t.text :username
      t.string :password_digest

      t.timestamps
    end
    add_index :referees, :username, unique: true
  end
end
