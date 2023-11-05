class RoomsController < ApplicationController
    def new
        @room = Room.new(
            content: params[:content]
            user_id: current_user.id
        )
    end
end
