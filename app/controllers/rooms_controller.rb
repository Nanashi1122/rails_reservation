class RoomsController < ApplicationController

    def index
        @rooms = Room.all
    end

    def search
        if params[:default_query].present?
            @rooms = Room.where('address LIKE ?', "#{params[:default_query]}%")
        elsif params[:query].present?
            @rooms = Room.where('name LIKE ? OR introduction LIKE ?', "%#{params[:query]}%", "%#{params[:query]}%")
        elsif params[:address].present?
            @rooms = Room.where('address LIKE ?', "%#{params[:address]}%")
        else
            @rooms = Room.all
        end
    end

    def new   
        @room = Room.new
        @rooms = Room.all
    end

    def create
        @room = Room.new(params.require(:room).permit(:name, :introduction, :fee, :address, :room_image))
        @room.user_id = current_user.id
        if @room.save
            redirect_to action: :myroom
        else
            render :new
        end
    end

    def show
        @room = Room.find(params[:id])
        @reservation = Reservation.new
    end 

    def myroom
        @rooms = Room.all
    end 

    def edit
        @room = Room.find(params[:id])
    end
  
    def update
        @room = Room.find(params[:id])
        if @room.update(params.require(:room).permit(:name, :introduction, :fee, :address, :room_image))
            flash[:notice] = "roomIDが「#{@room.id}」の施設情報を更新しました"
            redirect_to action: "show"
        else
            render "edit"
        end
    end
  
    def destroy
    end
end
