class TicketNotAvailable < StandardError
  def http_status
    400
  end

  def code
    'ticket_not_enough'
  end

  def message
    "There is not enough ticket for selling or reserving!"
  end

  def to_hash
    {
      message: message,
      code: code
    }
  end
end