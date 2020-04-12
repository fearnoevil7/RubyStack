class UsersController < ApplicationController
    def index
    end
    def configure
        @user = User.create(user_params)
        puts @user
        unless session[:count]
            session[:count] = 1
        else
            session[:count] +=1
        end
        flash[:success] = "Thanks for submitting this form! You have submitted this form " + session[:count].to_s + " times now."
        redirect_to "/show"
        # puts params
    end
    def result
        @flash = flash[:success]
        @user = User.last
    end
    private
    def user_params
        params.require(:user).permit(:name, :location, :language, :comment)
    end
end