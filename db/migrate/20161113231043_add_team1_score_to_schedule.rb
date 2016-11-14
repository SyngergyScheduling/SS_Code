class AddTeam1ScoreToSchedule < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :team1_score, :integer
  end
end
