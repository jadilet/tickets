class AddQuantityToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :quantity, :integer
  end
end
