class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
    if @user
      session["user_id"] = @user.id
      puts "*******user*******"
      p @user
      puts "*******session*******"
      p session['user_id']
      redirect_to "/users/show/" + session["user_id"].to_s
    else
      puts "*******user*******"
      p @user
      flash[:notice] = ["login unsuccessful"]
      redirect_to "/sessions/new"
    end
  end
  def destroy
    reset_session
    redirect_to "/sessions/new"
  end
end
