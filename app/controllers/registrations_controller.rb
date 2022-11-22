class RegistrationsController < ApplicationController 
    def new
        @user = User.new
    end

    def create
        @user = User.find_by(email: params[:email])
        if !!@user && @user.authenticate(params[:password])
            flash.alert = "You are logged in succesfully"
        else
            message = "Something gone wrong!!"
            redirect_to root_path, notice: message
        end
    end
end