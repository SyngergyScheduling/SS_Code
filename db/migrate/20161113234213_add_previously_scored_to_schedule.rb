class AddPreviouslyScoredToSchedule < ActiveRecord::Migration[5.0]
  def change
    add_column :schedules, :previously_scored, :integer
  end
end
