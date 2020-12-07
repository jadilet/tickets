class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.references :ticket, null: false, foreign_key: true
      t.string :name
      t.string :email
      t.decimal :amount
      t.references :user, null: true, foreign_key: true
      t.integer :total

      t.timestamps
    end
  end
end
