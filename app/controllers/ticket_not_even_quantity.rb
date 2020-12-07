class TicketNotEvenQuantity < StandardError
  def http_status
    400
  end

  def code
    'ticket_not_even_quantity'
  end

  def message
    "Ticket only sell in even quantity"
  end

  def to_hash
    {
      message: message,
      code: code
    }
  end
end