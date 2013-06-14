class ChangeCampaignIdToFundraiserIdInTeams < ActiveRecord::Migration
  def change
    remove_column :teams, :campaign_id
    add_column :teams, :fundraiser_id, :integer
  end
end
