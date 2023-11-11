class RoomsController < ApplicationController

    def index
        @rooms = Room.all
    end

    def new
        @room = Room.new
        @users =User.all
    end

    def create
        @room = Room.new(params.require(:room).permit(:name, :introduction, :fee, :address))
        if @room.save
            flash[:notice] = "施設を新規登録しました"
            redirect_to "users"
        else
            flash[:notice] = "失敗"
            render "new"
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
end
