class RoomController < ApplicationController
    before_action :load_entities

    def index
        @rooms = Room.all
        render json: @rooms
    end

    def new
        @room = Room.new
    end

    def create
        @room = Room.new permitted_parameters

        if @room.save
            render json: @room
        else
            render :new
        end 
    end

    def edit
    end

    def show
        @chat = Room.find[params[:id]]
        render json: room, include: [:room_messages]
    end

    protected

    def load_entities
        @rooms = Room.all
        @room = Room.find(params[:id]) if params[:id]
    end

    def permitted_parameters
        params.require(:room).permit(:name)
    end
end
