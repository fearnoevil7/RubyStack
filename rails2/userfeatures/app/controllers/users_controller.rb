class UsersController < ApplicationController
  def index
    @user = User.find_by(id:session['user_id'])
  end
  def new
    @user = User.new
  end
  def create
    # if @user.valid?
    puts 'test'
    @user= User.new(user_params)
    puts user_params
    puts @user.errors.full_messages
    puts @user
      if @user.valid?
        @user.save
        # @user = User.create(user_params)
        session['user_id'] = @user.id
        redirect_to "/users/" + session['user_id'].to_s
    else
      flash[:notice] = ["Invalid Inputs"]
      redirect_to "/users/new"
    end
  end
  def show
  end
  def edit
    @user = User.find_by(id:session['user_id'])
  end
  def update
    params_edit = user_params
    puts params_edit[:name]
    puts params_edit[:email]
    @user = User.find_by(id:params[:userid])
    if @user.update(name: params_edit[:name], email: params_edit[:email])
      redirect_to "/users/" + @user.id.to_s + "/edit"
    else
      flash[:notice] = ["Email is invalid"]
      redirect_to "/users/" + session['user_id'].to_s + "/edit"
      # redirect_to "/users/" + @user.id.to_s + "edit"
    end
  end
  def destroy
    @user = User.find_by(session['userid'])
    @user.delete
    redirect_to "/users/new"
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
