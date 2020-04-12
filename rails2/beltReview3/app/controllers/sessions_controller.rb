class SessionsController < ApplicationController
  def create
    puts "*******params*******"
    p params
    puts "*******params*******"
    puts params
    @user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
    puts "*******params*******"
    puts params
    puts "*******user*******"
    p @user
    if @user
      session["user_id"] = @user.id
      redirect_to "/events"
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to "/"
    end
  end

  def destroy
    reset_session
    redirect_to "/"
  end
end
