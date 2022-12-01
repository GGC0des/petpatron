class AddCommentToCaretakings < ActiveRecord::Migration[7.0]
  def change
    add_column :caretakings, :comment, :text
  end
end
