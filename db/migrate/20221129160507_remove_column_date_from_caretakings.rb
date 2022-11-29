class RemoveColumnDateFromCaretakings < ActiveRecord::Migration[7.0]
  def change
    remove_column :caretakings, :date
  end
end
