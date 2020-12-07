class AddEventToTicket < ActiveRecord::Migration[6.0]
  def change
    add_reference :tickets, :event, null: false, foreign_key: true, index: true, unique: true
  end
end
