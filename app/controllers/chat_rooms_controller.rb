class ChatRoomsController < ApplicationController
    def show_a_room
        @firebase_uid = "nnn"
        @custom_token = FirebaseTokensController.get_custom_token(@firebase_uid)
    end
    
    def show_the_room
        @current_user = current_user
        if @current_user.uname == params[:receiver_id]
            @firebase_uid = params[:receiver_id]
            @custom_token = FirebaseTokensController.get_custom_token(@firebase_uid)
            @receiver_id = params[:receiver_id]
            @sender_id = params[:sender_id]
        else
            flash[:info] = "nnnnnnn"
            redirect_to root_path
        end
    end
end