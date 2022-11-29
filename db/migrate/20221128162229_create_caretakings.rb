class CreateCaretakings < ActiveRecord::Migration[7.0]
  def change
    create_table :caretakings do |t|
      t.date :date
      t.datetime :start_time
      t.string :volunteer_type
      t.references :animal, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
