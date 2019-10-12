class CreateSpiritualAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :spiritual_attributes do |t|
      t.integer :will
      t.integer :luck
      t.integer :initiative
      t.integer :sanity

      t.timestamps
    end
  end
end
