class UsersController < ApplicationController
    def start
        render text: "Welcome!!!!!!!!!"
    end
    def show_all
        @users = User.all
    end
    def create
        @user = User.create(user_params)
        puts @user
        redirect_to "/users"
    end
    def view
        @user = User.find_by(id:params[:id])
        render json: @user
    end
    def editHome
        @user = User.find_by(id:params[:id])
    end
    def total
        @user= User.all.length
    end
    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :age)
    end
end
