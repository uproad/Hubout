class CreateTrpgSystems < ActiveRecord::Migration[5.2]
  def change
    create_table :trpg_systems do |t|
      t.string :name

      t.timestamps
    end
  end
end
