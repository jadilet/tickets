class ChangeColumnNamePayment < ActiveRecord::Migration[6.0]
  def change
    rename_column :payments, :total, :quantity
  end
end
