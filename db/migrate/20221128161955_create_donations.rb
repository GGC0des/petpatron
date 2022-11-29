class CreateDonations < ActiveRecord::Migration[7.0]
  def change
    create_table :donations do |t|
      t.integer :donation_amount
      t.text :comment
      t.references :user, null: false, foreign_key: true
      t.references :emergency, null: false, foreign_key: true

      t.timestamps
    end
  end
end
