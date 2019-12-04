class AddPlayersNumberToCampaign < ActiveRecord::Migration[5.2]
  def change
    add_column :campaigns, :players_number, :integer
  end
end
