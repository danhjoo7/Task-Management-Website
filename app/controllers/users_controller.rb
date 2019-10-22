class UsersController < ApplicationController
    def index
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid
            @user.save
            sessions[:user_id] = @user.id
            redirect_to @user
        else
            redirect_to signup_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :password_confirmation)
    end

end
