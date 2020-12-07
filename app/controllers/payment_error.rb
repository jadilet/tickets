class PaymentError
  def message
    "Something went wrong with your transaction!"
  end

  def http_status
    500
  end

  def code
    'payment_error'
  end

  def to_hash
    {
      message: message,
      code: code
    }
  end
end