class ReservationWorker
  include Sidekiq::Worker

  def perform
    Reservation.outdated.each do |reservation|
      ticket = reservation.ticket.lock!("FOR UPDATE NOWAIT")
      ticket.quantity += reservation.quantity
      ticket.save!
      reservation.destroy!
    end
  end
end