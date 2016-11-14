class AddTeam2StyleToSchedule < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :team2_style, :integer
  end
end
