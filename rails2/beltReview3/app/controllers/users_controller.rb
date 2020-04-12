class UsersController < ApplicationController
  def index
  end

  def edit
    @user = User.find_by(id: session["user_id"])
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      p @user
      puts "*******user successfully created*******"
      @user.save
      session["user_id"] = @user.id
      puts "*******session id*******"
      puts session["user_id"]
      redirect_to "/events"
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to "/"
    end
  end
  def update
    puts "*******params*******"
    puts params
    # puts "*******user*******"
    @user = User.find_by(id:params[:userid])
    @users = User.all
    if @users.include? @user
      if @user.id == session["user_id"]
        if @user.update(first_name: user_params[:first_name], last_name: user_params[:last_name], email: user_params[:email], location: user_params[:location], state: user_params[:state])
          flash[:notice] = ["User successfully edited!!!!!!!"]
          redirect_to "/users/edit"
        else
          flash[:notice] = @user.errors.full_messages
          redirect_to "/users/edit"
        end
      else
        flash[:notice] = ["fuck you stop hacking"]
        redirect_to "/users/edit"
      end
    else
      flash[:notice] = ["That user does not exist"]
      redirect_to "/users/edit"
    end
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
  end
end
