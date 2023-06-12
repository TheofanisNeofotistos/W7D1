class UsersController < ApplicationController
    def index
        @users = User.all
        render :index
    end

    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_url(@user.user_id)
        else
            render :new
        end

    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end