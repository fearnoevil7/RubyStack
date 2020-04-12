class UsersController < ApplicationController
  skip_before_action :authorize, only: [:index]
  def edit
  end

  def index
  end
  def create
    @user = User.new(user_params)
      if @user.valid?
        p @user
        @user.save
        session["user_id"] = @user.id
        redirect_to "/courses"
      else
        flash[:notice] = @user.errors.full_messages
        puts @user.errors.full_messages
        redirect_to "/"
      end
    end
    def ascend
      @course = Course.find_by(id:params[:courseid])
      @courses = Course.all
      if @courses.include? @course
        session['signup-count'] = 5
        puts "*******count"
        puts session["signup-count"]
        redirect_to "/courses/" + params[:courseid].to_s
      else
        flash[:notice] = ["stop hacking"]
        redirect_to "/"
      end
    end
    def descend
      @course = Course.find_by(id:params[:courseid])
      @courses = Course.all
      if @courses.include? @course
        session['signup-count'] = 4
        puts "*******count"
        puts session["signup-count"]
        redirect_to "/courses/" + params[:courseid].to_s
      else
        flash[:notice] = ["stop hacking"]
        redirect_to "/"
      end
    end
    private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
