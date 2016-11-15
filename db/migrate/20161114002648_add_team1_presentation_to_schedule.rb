class AddTeam1PresentationToSchedule < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :team1_presentation, :integer
  end
end
