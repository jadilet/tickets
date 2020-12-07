class PaymentsController < ApplicationController
  before_action :sanitize_reservation_params

  def pay
    ticket = Ticket.find(params[:id])
    raise TicketOutdated unless ticket.active?
    raise TicketNotAvailable unless  ticket.available?(params[:quantity])

    amount = params[:quantity] * ticket.price

    result = PaymentsHelper::Adapters::Payment::Gateway.charge(amount: amount, token: "token")

    if user_signed_in?
      Ticket.transaction do
        ticket = ticket.lock!("FOR UPDATE NOWAIT")
        payment = current_user.payments.new(payment_params)
        payment.amount = result.amount
        payment.currency = result.currency
        payment.ticket = ticket

        ticket.quantity -= params[:quantity]

        payment.save!
        ticket.save!
      end
    else
      Ticket.transaction do
        ticket = ticket.lock!("FOR UPDATE NOWAIT")
        payment = Payment.new(payment_params)
        payment.amount = result.amount
        payment.currency = result.currency
        payment.ticket = ticket

        ticket.quantity -= params[:quantity]

        payment.save!
        ticket.save!
      end
    end

    render json: {message: "Successfully bought #{params[:quantity]} tickets!"}, status: :created
  end

  def info
  end


  private
  def payment_params
    params.permit(:card_number, :cvv, :exp_month, :exp_year, :name, :email, :address, :quantity)
  end
end
