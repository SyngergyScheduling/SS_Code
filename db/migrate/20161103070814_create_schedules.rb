class CreateSchedules < ActiveRecord::Migration[5.0]
  def change
    create_table :schedules do |t|
      t.integer :team1_id
      t.integer :team2_id

      t.timestamps
    end
  end
end
