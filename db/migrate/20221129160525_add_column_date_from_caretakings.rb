class AddColumnDateFromCaretakings < ActiveRecord::Migration[7.0]
  def change
    add_column :caretakings, :date, :datetime
  end
end
