class ChangeBugetDefault < ActiveRecord::Migration
  def change
    change_column :teams, :budget, :integer, :default => 0
  end
end
