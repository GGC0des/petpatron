class AddStatusToCaretakings < ActiveRecord::Migration[7.0]
  def change
    add_column :caretakings, :status, :integer, default: 0
  end
end
