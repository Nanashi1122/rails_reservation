class ResevationsController < ApplicationController
    def home
    end

    def create

    end

    private

    def reservation_params
        params.require(:reservation).permit(:checkin, :checkout, :day, :num_of_people,)
    end
end
