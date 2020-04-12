class SessionsController < ApplicationController
    def new
    end
    def create
        # puts User.find_by_email(params[:email]).try(:authenticate, params[:password])
        @user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
        if @user
            session['user_id'] = @user.id
            redirect_to '/users/' + session['user_id'].to_s
        else
            puts 'login failed'
            flash[:notice] = ["Invalid Combination"]
            redirect_to '/sessions/new'
        end
    end
    def destroy
        reset_session
        redirect_to "/sessions/new"
    end
end
