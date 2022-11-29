class RemoveColumnStartTimeFromCaretakings < ActiveRecord::Migration[7.0]
  def change
    remove_column :caretakings, :start_time
  end
end
