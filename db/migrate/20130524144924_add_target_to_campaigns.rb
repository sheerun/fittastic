class AddTargetToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :target, :integer
  end
end
