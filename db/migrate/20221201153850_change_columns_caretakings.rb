class ChangeColumnsCaretakings < ActiveRecord::Migration[7.0]
  def change
    remove_column :caretakings, :volunteer_type, :string
    add_reference :caretakings, :category, index: true
  end
end
