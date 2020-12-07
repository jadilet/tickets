class TicketNotAllTogether < StandardError
  def http_status
    400
  end

  def code
    'ticket_not_all_together'
  end

  def message
    "Ticket only sell all together"
  end

  def to_hash
    {
      message: message,
      code: code
    }
  end
end