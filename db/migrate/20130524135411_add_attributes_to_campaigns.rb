class AddAttributesToCampaigns < ActiveRecord::Migration
  def change
    add_column :campaigns, :user, :string
    add_column :campaigns, :purpose, :string
    add_column :campaigns, :occasion, :string
  end
end
