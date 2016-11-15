class AddTeam2UnderstandingToSchedule < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :team2_understanding, :integer
  end
end
