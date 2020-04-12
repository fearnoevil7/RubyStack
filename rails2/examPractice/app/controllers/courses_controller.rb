class CoursesController < ApplicationController
  def index
    @user = User.find_by(id:session["user_id"])
    @courses = Course.all
    @courses2 = @courses.sort_by { |course| course.joins.length }.reverse
    @courses3 = @courses.sort_by { |course| course.joins.length }
    @count = session['count']
  end
  
  def new
  end

  def show
    @user = User.find_by(id: session["user_id"])
    @course = Course.find_by(id: params[:courseid])
    @courses = Course.all
    if @courses.include? @course
      @signups2 = @course.users_that_joined.sort_by { |users_that_joined| users_that_joined.created_at }.reverse
      @signups3 = @course.users_that_joined.sort_by { |users_that_joined| users_that_joined.created_at }
      # @courses2 = @courses.sort_by { |course| course.joins.length }.reverse
      # @courses3 = @courses.sort_by { |course| course.joins.length }
      @count = session['signup-count']
    else
      flash[:notice] = ["stop hacking"]
      redirect_to "/"
    end
  end


  def create
    @user = User.find_by(id:session["user_id"])
    @course = Course.new(course_params)
    if @course.valid?
      @course.save
      puts "successfully created course"
      p @course
      flash[:notice] = ["successfully created course"]
      redirect_to "/courses"
    else
      flash[:notice] = @course.errors.full_messages
      redirect_to "/courses"
    end
  end

  def edit
    @course = Course.find_by(id: params[:courseid])
    @courses = Course.all
    if @courses.include? @course
      @user = User.find_by(id:session["user_id"])
    else
      flash[:notice] = ["stop hacking"]
      redirect_to "/"
    end
  end

  def update
    @course = Course.find_by(id:params[:courseid])
    @courses = Course.all
    if @courses.include? @course
      if @course.update(name: course_params[:name], instructor: course_params[:instructor], capacity: course_params[:capacity])
        flash[:notice] = ["successfully updated"]
        redirect_to "/courses/" + @course.id.to_s
      else
        flash[:notice] = @course.errors.full_messages
        redirect_to "/courses/" + @course.id.to_s + "/edit"
      end
    else
      flash[:notice] = ["stop hacking"]
      redirect_to "/"
    end
  end
  def destroy
    @user = User.find_by(id:session["user_id"])
    @course = Course.find_by(id: params[:courseid])
    if @course.user.id == @user.id
      @course.destroy
      redirect_to "/courses"
    else
      flash[:notice] = ["stop fucking hacking"]
      redirect_to "/coures"
    end
  end
  def order_asc
    session['count'] = 1
    puts "*******count"
    puts session["count"]
    redirect_to "/courses"
  end
  def order_desc
    session['count'] = 0
    puts "*******count"
    puts session["count"]
    redirect_to "/courses"
  end
  private
  def course_params
    params.require(:course).permit(:name, :instructor, :capacity).merge(user: User.find_by(id:session["user_id"]))
  end

  def asc
    @courses3 = @course.sort_by { |course| course.joins.length }
  end
  def desc
    @courses = @courses.sort_by { |course| course.joins.length }.reverse
  end
end
