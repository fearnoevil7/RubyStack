class SessionsController < ApplicationController
    skip_before_action :authorize
    def create
        @user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
        if @user
            session["user_id"] = @user.id
            redirect_to "/courses"
        else
            flash[:notice] = ['invalid combination']
            redirect_to "/"
        end
    end
    def destroy
        reset_session
        redirect_to '/'
    end
end
