class AddNameMesterToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :name, :string
    add_column :players, :master, :boolean, default: false
  end
end
