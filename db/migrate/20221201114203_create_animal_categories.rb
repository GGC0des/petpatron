class CreateAnimalCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :animal_categories do |t|
      t.references :animal, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
