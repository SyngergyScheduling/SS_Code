class AddTeam1StyleToSchedule < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :team1_style, :integer
  end
end
