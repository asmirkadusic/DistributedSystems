class RoomsController < ApplicationController
    before_action :load_entities

    def index
        @rooms = Room.all
    end

    def new
        @room = Room.new
    end

    def create
        @room = Room.new permitted_parameters

        if @room.save
            flash[:succes] = "Room #{@room.name} was cretaed successfully!"
            redirect_to rooms_path
        else
            render :new
        end 
    end

    def edit
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
