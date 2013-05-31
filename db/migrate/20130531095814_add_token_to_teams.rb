class AddTokenToTeams < ActiveRecord::Migration
  def change
    add_column :teams, :token, :string
  end
end
