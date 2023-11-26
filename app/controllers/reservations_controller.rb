class ReservationsController < ApplicationController
  def home
  end

  def new

  end

  def myreservation
    @reservations = Reservation.all
  end

  def create
    @reservation = Reservation.new(params.require(:reservation).permit(:checkin, :checkout, :num_of_people, :room_id))
    @reservation.user_id = current_user.id
    if @reservation.save
      flash[:notice] = "予定を確定しました"
      redirect_to root_path
    else
      flash[:notice] = "予定の確定に失敗しました"
      @rooms = Room.all
      redirect_to controller: :rooms,action: :show
    end
  end
end
