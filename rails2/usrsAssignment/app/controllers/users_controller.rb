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
      redirect_to "/users/new"
    end
  end
  def show
  end
  def edit
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
