class AddAccountHolderToDonations < ActiveRecord::Migration[7.0]
  def change
    add_column :donations, :account_holder, :string
  end
end
