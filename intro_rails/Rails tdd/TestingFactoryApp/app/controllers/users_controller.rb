class UsersController < ApplicationController
    def new
    end
    def create
        @user = User.new(params.require(:user).permit(:first_name, :last_name, :email))
        if @user.save
            flash[:notice] = ['Welcome, ' + @user.first_name.to_s]
            redirect_to "/users/"+@user.id.to_s
        else
            flash[:notice] = @user.errors.full_messages
            redirect_to "/users/new"
        end
    end
end
