class RenameArchivedFundraisersToFundraisers < ActiveRecord::Migration
  def change
    rename_table :archived_fundraisers, :fundraisers
  end
end
