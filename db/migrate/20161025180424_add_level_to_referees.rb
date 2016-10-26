class AddLevelToReferees < ActiveRecord::Migration[5.0]
  def change
    add_column :referees, :level, :integer
  end
end
