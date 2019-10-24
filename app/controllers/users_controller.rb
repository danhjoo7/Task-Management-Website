class UsersController < ApplicationController
    before_action :authorized, except: [:new]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to @user
        else
            flash[:errors] = "Invalid username and/or password."
            redirect_to signup_path
        end
    end

    def show
        # byebug
        @user = User.find(params[:id])
        @assigned_tasks = Task.show_user_assigned_tasks(@user)
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :password, :password_confirmation)
    end

end
