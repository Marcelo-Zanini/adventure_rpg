class CreateCampaigns < ActiveRecord::Migration[5.2]
  def change
    create_table :campaigns do |t|
      t.string :name
      t.text :description
      t.references :player, foreign_key: true

      t.timestamps
    end
  end
end
