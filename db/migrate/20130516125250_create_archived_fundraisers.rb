class CreateArchivedFundraisers < ActiveRecord::Migration
  def change
    create_table :archived_fundraisers do |t|
      t.integer :team_id
      t.integer :campaign_id
      t.decimal :total_amount, :precision => 8, :scale => 2

      t.timestamps
    end
  end
end
