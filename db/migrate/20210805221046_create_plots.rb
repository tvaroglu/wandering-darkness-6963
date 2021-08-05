class CreatePlots < ActiveRecord::Migration[5.2]
  def change
    create_table :plots do |t|
      t.integer :number
      t.string :size
      t.string :direction
      t.references :garden, foreign_key: true

      t.timestamps
    end
  end
end
