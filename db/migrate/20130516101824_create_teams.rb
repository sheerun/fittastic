class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :nip
      t.string :campaign_id
      t.string :name
      t.string :picture
      t.integer :budget

      t.timestamps
    end
  end
end
