class CreateGardenBeds < ActiveRecord::Migration[5.2]
  def change
    create_table :garden_beds do |t|
      t.references :plant, foreign_key: true
      t.references :plot, foreign_key: true

      t.timestamps
    end
  end
end
