class RoomMessageController < ApplicationController
    before_action :load_entities

    def create
        @room_message = RoomMessage.new(message_params)
        if @room_message.save
            @chat_room = Room.find(@room_message.room)
            RoomChannel.broadcast_to(@chat_room, @room_message)
            # render json: @room_message
        else
            render json: {}
        end
    end

    protected

    def load_entities
        @room = Room.find params.dig(:room_message, :room_id)
    end

    private 

    def message_params
        params.require(:room_message).permit(:content, :room_id)
    end
end
