class JoinsController < ApplicationController
    def create
        @user = User.find_by(id:session["user_id"])
        @course = Course.find_by(id: params[:courseid])
        @courses = Course.all
        if @courses.include? @course
            @join = Join.new(user: @user, course: @course)
            if @join.valid?
                unless @course.capacity == @course.joins.length
                    @join.save
                    p @join
                    flash[:notice] = ["successfully added join"]
                    redirect_to "/courses"
                else
                    flash[:notice] = ["Sorry the desired class is full"]
                    redirect_to "/courses"
                end
            else
                flash[:notice] = ["unable to add join"]
                redirect_to "/courses"
            end
        else
            flash[:notice] = ["stop hacking"]
            redirect_to "/"
        end
    end
    def destroy
        @course = Course.find_by(id:params[:courseid])
        @courses = Course.all
        if @courses.include? @course
            @join = @course.joins.find_by(user: User.find_by(id:session["user_id"]))
            if @join
                @join.destroy
                flash[:notice] = ["removed course from added coursed"]
                redirect_to "/courses"
            else
                flash[:notice] = ["unable to remove course"]
                redirect_to "/courses"
            end
        else
            flash[:notice] = ["stop hacking"]
            redirect_to "/"
        end
    end
end
