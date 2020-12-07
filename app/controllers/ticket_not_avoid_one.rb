class TicketNotAvoidOne < StandardError
  def http_status
    400
  end

  def code
    'ticket_not_avoid_one'
  end

  def message
    "Ticket only sell without leave one ticket"
  end

  def to_hash
    {
      message: message,
      code: code
    }
  end
end