class AddTeamIdToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :team_id, :integer
  end
end
