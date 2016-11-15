class AddTeam2ResponseToSchedule < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :team2_response, :integer
  end
end
