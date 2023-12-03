class RoomsController < ApplicationController

    def index
        @rooms = Room.all
    end

    def search
        @searched = params[:address].present? || params[:name].present?
        if params[:address].present? && params[:name].present?
            @rooms = Room.where('address LIKE ? AND name LIKE ?', "%#{params[:address]}%", "%#{params[:name]}%")
        elsif params[:address].present?
            @rooms = Room.where('address LIKE ?', "%#{params[:address]}%")
        elsif params[:name].present?
            @rooms = Room.where('name LIKE ?', "%#{params[:name]}%")
        else
            @rooms = Room.all
        end
    end

    def new   
        @room = Room.new
        @rooms = Room.all
    end

    def create
        @room = Room.new(params.require(:room).permit(:name, :introduction, :fee, :address, :room_image, :area))
        @room.user_id = current_user.id
        if @room.save
            flash[:notice] = "施設を新規登録しました"
            redirect_to action: :myroom
        else
            flash[:notice] = "施設の登録に失敗しました"
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
        if @room.update(params.require(:room).permit(:name, :introduction, :fee, :address, :room_image, :area))
            flash[:notice] = "roomIDが「#{@room.id}」の施設情報を更新しました"
            redirect_to action: "show"
        else
            render "edit"
        end
    end
  
    def destroy
    end

    private
    def room_params
        params.require(:room).permit(:name, :introduction, :fee, :address, :post_image)
    end
end
