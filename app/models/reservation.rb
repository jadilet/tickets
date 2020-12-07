class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :ticket

  def self.outdated
    self.where("created_at < ?", DateTime.now - 15.minutes)
  end
end
