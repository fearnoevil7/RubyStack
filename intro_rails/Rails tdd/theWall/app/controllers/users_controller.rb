class UsersController < ApplicationController
  def new
  end
  def create
    unless User.find_by(username:params[:user][:username])
      @user = User.create(user_params)
      if @user.valid?
        session['user_id'] = @user.id
        id = session['user_id']
        puts "User id is......... " + id.to_s
        flash[:notice] = ["User successfully created"]
        redirect_to "/messages/" + session['user_id'].to_s
      else
        flash[:notice] = "Cannot create user... username invalid"
        redirect_to "/users/new"
      end
    else
        @user = User.find_by(username:params[:user][:username])
        session['user_id'] = @user.id
        id = session['user_id']
        puts id
        flash[:notice] = ["User successfully logged in"]
        redirect_to "/messages/" + session['user_id'].to_s
      # else
      #   redirect_to "users/new"
      # end
    end
  end
  def logout
    reset_session
    redirect_to "/users/new"
  end
  private
  def user_params
    params.require(:user).permit(:username)
  end
end

    # unless User.find_by(username:params[:user][:username])
    #   @user = User.new(params.require(:user).permit(:username))
    #   if @user.save
    #     flash[:notice] = ["User successfully created"]
    #     redirect_to "/messages"
    #   else
    #     redirect_to "users/new"
    #   end
    
# end
