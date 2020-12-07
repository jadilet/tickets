
class CardError < StandardError
  def http_status
    500
  end

  def code
    'card_error'
  end

  def message
    "Your card has been denied"
  end

  def to_hash
    {
      message: message,
      code: code
    }
  end
end