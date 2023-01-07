class RegistrationsController < ApplicationController 
    def new
        @user = User.new
    end

    def check
        # this works for login users
        @possibleUser = User.new(user_params)
        @possibleuserNew = User.find_by(email: user_params[:email], password: user_params[:password])
        if User.exists?(:email => user_params[:email], :password => user_params[:password])
            render json: {"status": "ok"}
        else
            render json: {"user": "not found"}
        end
    end

    
    def create
        @user = User.new user_params
        if @user.save
            session[:user_id] = @user.id
            render json: @user, status: 201
        else
            render json: { errors: @user.errors.full_messages}
        end
    end

    

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
