class AddDescriptionToShelters < ActiveRecord::Migration[7.0]
  def change
    add_column :shelters, :description, :text
  end
end
