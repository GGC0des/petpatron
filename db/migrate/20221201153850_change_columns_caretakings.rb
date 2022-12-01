class ChangeColumnsCaretakings < ActiveRecord::Migration[7.0]
  def change
    remove_column :caretakings, :volunteer_type
  end
end
