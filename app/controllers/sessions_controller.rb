class SessionsController < ApplicationController
    def new
    end

    #if user exists and we can authenticate user's password, we redirect to user and start a session
    def create
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to @user
        else
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil 
        redirect_to home_path 
    end
end