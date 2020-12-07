class AddAddressColumnToPayment < ActiveRecord::Migration[6.0]
  def change
    add_column :payments, :address, :string
    add_column :payments, :currency, :string
  end
end
