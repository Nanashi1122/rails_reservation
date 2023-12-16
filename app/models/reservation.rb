class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def total_nights
    (checkout - checkin).to_i
  end
end
