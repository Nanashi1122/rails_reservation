class RoomsController < ApplicationController

    def index
        @rooms = Room.all
    end

    def new
        @room = Room.new
        @rooms = Room.all
    end

    def create
        @room = Room.new(params.require(:room).permit(:name, :introduction, :fee, :address, :room_image))
        @room.user_id = current_user.id
        if @room.save
            binding.pry
            flash[:notice] = "施設を新規登録しました"
            redirect_to action: "index"
        else
            flash[:notice] = "失敗"
            render :new
        end
    end

    def show
    end
  
    def edit
    end
  
    def update
    end
  
    def destroy
    end

    private
    def room_params
        params.require(:room).permit(:name, :introduction, :fee, :address, :post_image)
    end
end
