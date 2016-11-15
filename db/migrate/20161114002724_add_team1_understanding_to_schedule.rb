class AddTeam1UnderstandingToSchedule < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :team1_understanding, :integer
  end
end
