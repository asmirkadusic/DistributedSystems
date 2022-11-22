class SessionsController < ApplicationController
    def create
        @user = User.find_by(username: params[:username])
        if !!@user && @user.authenticate(params[:password])
            # setting session
            session[:user_id] = @user.id
            redirect_to user_path
        else
            message = "Something gone wrong!!"
            redirect_to login_path, notice: message
        end
    end
end