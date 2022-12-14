class RegistrationsController < ApplicationController 
    def new
        @user = User.new
    end

    def check
        # this works for login users
        @possibleUser = User.new(user_params)
        @possibleuser = User.find_by(email: user_params[:email], password: user_params[:password])
        if User.exists?(:email => user_params[:email], :password => user_params[:password])
            render json: @possibleUser
        else
            render json: {}
        end
    end

    
    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            render :json => { :error => 0, :success => 1}
        else
            render :json => { :error => 1, :success => 0}
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end
end
