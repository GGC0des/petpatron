class AddCoordinatesToShelters < ActiveRecord::Migration[7.0]
  def change
    add_column :shelters, :latitude, :float
    add_column :shelters, :longitude, :float
  end
end
