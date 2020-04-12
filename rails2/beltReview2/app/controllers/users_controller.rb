class UsersController < ApplicationController

  def index
    render_text "welcome"
  end
  def edit
    puts params
    @user = User.find_by(id: params[:userid])
  end

  def new
  end
  
  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      puts "*******user successfully created"
      p @user
      session["user_id"] = @user.id
      # redirect_to "/user/" + @user.id.to_s
      # redirect_to "/users/new"
      redirect_to "/events"
    else
      p @user
      puts "*******user successfully created"
      flash[:notice] = @user.errors.full_messages
      redirect_to "/users/new"
    end
  end
  def update
    params_edit = user_params
    @user = User.find_by(id:params[:userid])
    if @user.update(first_name: params_edit[:first_name], last_name: params_edit[:last_name], email: params_edit[:email], location: params_edit[:location], state: params_edit[:state])
      flash[:notice] = ["Successfully updated records"]
      redirect_to "/users/" + @user.id.to_s + "/edit"
    else
      flash[:notice] = @user.errors.full_messages
      redirect_to "/users/" + @user.id.to_s + "/edit"
    end
  end
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
  end
end
