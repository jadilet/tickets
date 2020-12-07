class ReservationsController < ApplicationController
  before_action :authenticate_user!, :sanitize_reservation_params

  # POST /reservations/reserve
  # Params: quantity // ticket
  def reserve
    @event = Event.find(params[:id])

    ticket = @event.ticket

    raise TicketOutdated unless ticket.active?
    raise TicketNotAvailable unless  ticket.available?(params[:quantity])

    Ticket.transaction do
      ticket = ticket.lock!("FOR UPDATE NOWAIT")
      reservation = current_user.reservations.new(reservation_params)
      reservation.ticket = ticket
      ticket.quantity -= params[:quantity]

      reservation.save!
      ticket.save!
    end

    render json: {message: "Successfully reserved #{params[:quantity]} tickets!"}, status: :created
  end

  private
  def reservation_params
    params.permit(:quantity)
  end
end
