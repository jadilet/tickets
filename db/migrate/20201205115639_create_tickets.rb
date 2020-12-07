class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.integer :quantity
      t.decimal :price
      t.references :type, null: false, foreign_key: true
      t.datetime :avail_start
      t.datetime :avail_end

      t.timestamps
    end
  end
end
