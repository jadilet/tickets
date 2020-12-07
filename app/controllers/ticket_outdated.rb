class TicketOutdated < StandardError
  def http_status
    400
  end

  def code
    'ticket_outdated'
  end

  def message
    "Ticket outdated!"
  end

  def to_hash
    {
      message: message,
      code: code
    }
  end
end