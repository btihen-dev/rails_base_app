class CreateSpecies < ActiveRecord::Migration[7.2]
  def change
    create_table :species do |t|
      t.string :kind, null: false

      t.timestamps
    end

    add_index :species, :kind, unique: true
  end
end
