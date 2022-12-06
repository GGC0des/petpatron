class AddPaymentStuffToDonations < ActiveRecord::Migration[7.0]
  def change
    add_column :donations, :expiry_date, :string
    add_column :donations, :security_code, :string
  end
end
