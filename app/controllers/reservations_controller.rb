class ReservationsController < ApplicationController
  def home
  end

  def new

  end

  def myreservation
    @reservations = Reservation.all
    @reservations = Reservation.includes(:room).all
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:checkin, :checkout, :num_of_people, :room_id))
    @reservation.user_id = current_user.id
    if @reservation.save
      redirect_to action: :myreservation
    else
      @rooms = Room.find(@reservation.room_id)
      render 'rooms/show'
    end
  end
end
