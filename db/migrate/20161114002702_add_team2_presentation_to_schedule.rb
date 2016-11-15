class AddTeam2PresentationToSchedule < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :team2_presentation, :integer
  end
end
