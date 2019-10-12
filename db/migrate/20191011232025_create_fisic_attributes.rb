class CreateFisicAttributes < ActiveRecord::Migration[5.2]
  def change
    create_table :fisic_attributes do |t|
      t.integer :strength
      t.integer :velocity
      t.integer :dexterity
      t.integer :max_health

      t.timestamps
    end
  end
end
