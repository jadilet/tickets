class Payment < ApplicationRecord
  belongs_to :ticket
  belongs_to :user, optional: true
end
