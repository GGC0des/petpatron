class CreateEmergencies < ActiveRecord::Migration[7.0]
  def change
    create_table :emergencies do |t|
      t.string :title
      t.text :description
      t.integer :fundraising_goal
      t.references :animal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
