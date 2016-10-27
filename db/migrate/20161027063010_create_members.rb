class CreateMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :members do |t|
      t.belongs_to :teams, index: true
      t.text :name
      t.timestamps
    end
  end
end
