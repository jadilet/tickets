class Ticket < ApplicationRecord
  belongs_to :type
  belongs_to :event
  has_many :reservations
  has_many :payments

  # @todo Ticket may sell until 1 hour left
  def active?
    if self.avail_start - 1.hour >= DateTime.now
      return true
    end

    false
  end

  # Ticket types for selling
  # ALL_TOGETHER (we can only buy all the tickets at once)
  # AVOID_ONE (we can only buy tickets in a quantity that will not leave only 1 ticket available)
  # EVEN (we can only buy tickets in quantity that is even)
  def available?(quantity)
    if quantity > self.quantity || quantity <= 0
      return false
    end

    case self.type.name
    when "EVEN"
      if quantity%2 == 0
        return true
      end
      raise TicketNotEvenQuantity
    when "ALL_TOGETHER"
      if quantity == self.quantity
        return true
      end
      raise TicketNotAllTogether
    when "AVOID_ONE"
      if self.quantity - quantity > 1 || self.quantity - quantity == 0
        return true
      end
      raise TicketNotAvoidOne
    else
      return false
    end
  end
end
