class AddTeam1ResponseToSchedule < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :team1_response, :integer
  end
end
