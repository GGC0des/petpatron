class CreateAnimals < ActiveRecord::Migration[7.0]
  def change
    create_table :animals do |t|
      t.string :name
      t.text :description
      t.string :sex
      t.string :size
      t.string :species
      t.references :shelter, null: false, foreign_key: true

      t.timestamps
    end
  end
end
