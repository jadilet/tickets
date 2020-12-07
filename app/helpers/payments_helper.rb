module PaymentsHelper
  module Adapters
    module Payment
      class Gateway

        Result = Struct.new(:amount, :currency)

        class << self
          def charge(amount: , token: , currency: "EUR")
            case token.to_sym
            when :card_error
              raise CardError
            when :payment_error
              raise PaymentError
            else
              Result.new(amount, currency)
            end

          end
        end
      end
    end
  end
end
