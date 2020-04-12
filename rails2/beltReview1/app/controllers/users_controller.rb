class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def edit
  end
  def create
    @user = User.new
    if @user.valid?
      @user.save
      session['user_id'] = @user.user_id
      puts "******* succeded in creating user"
      p @user
      redirect_to "/event"
    else
      puts "******* failed to create user"
      flash[:notice] = ["Invalid Inputs"]
      redirect_to "/users/new"
    end
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
  end
end
