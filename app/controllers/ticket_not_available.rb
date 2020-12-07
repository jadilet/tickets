class TicketNotAvailable < StandardError
  def http_status
    400
  end

  def code
    'ticket_not_available'
  end

  def message
    "Ticket not available for selling!"
  end

  def to_hash
    {
      message: message,
      code: code
    }
  end
end