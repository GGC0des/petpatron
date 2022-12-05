class AddIbanToDonations < ActiveRecord::Migration[7.0]
  def change
    add_column :donations, :iban, :string
  end
end
