class UsersController < ApplicationController
  def index
  end

  def new
  end
  def edit
    @user = User.find_by(id:session["user_id"])
    if @user
      flash[:notice] = ["you can edit your account if you would like"]
    else
      flash[:notice] = ["Fuck you stop hacking"]
      redirect_to "/sessions/new"
    end
  end
  def create
    @user = User.new(user_params)
    if @user.valid?
      # @user.save
      puts "*******creation of account successfull"
      p @user
      flash[:notice] = ["User successfully created!!!!!!!"]
      session['user_id'] = @user.id
      puts "*******user*******"
      p @user
      puts "*******session*******"
      puts session["user_id"]
      redirect_to "/users/show/" + @user.id.to_s
    else
      puts "*******failed to create"
      flash[:notice] = @user.errors.full_messages
      puts "*******errors*******"
      puts @user.errors.full_messages
      redirect_to '/users/new'
    end
  end

  def show
    puts "*******params*******"
    p params
    @users = User.all
    @user = User.find_by(id: params[:userid])
    if @user
      if @user.id == session["user_id"]
        puts "*******User*******"
        p @user
        @secrets = @user.secrets
        @likes = @user.secrets_liked
      else
        flash[:notice] = ["fuck you stop hacking"]
        redirect_to "/sessions/new"
      end
    else
      flash[:notice] = ["fuck you stop hacking"]
      redirect_to "/sessions/new"
    end
  end

  def update
    @user = User.find_by(id: params[:userid])
    if @user.id == session["user_id"]
      if @user.update(name: user_params[:name], email: user_params[:email])
        flash[:notice] = ["Update Successful!!!!!!!"]
        redirect_to "/users/show/" + @user.id.to_s
      else
        flash[:notice] = @user.errors.full_messages
        redirect_to "/users/" + @user.id.to_s + "/edit"
      end
    else
      flash[:notice] = ["Fuck you stop hacking"]
      redirect_to "/users/show/" + @user.id.to_s
    end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
