class CreateIntelectualAttributs < ActiveRecord::Migration[5.2]
  def change
    create_table :intelectual_attributs do |t|
      t.integer :intelligence
      t.integer :ocultism
      t.integer :culture
      t.integer :reasoning

      t.timestamps
    end
  end
end