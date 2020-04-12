class StudentsController < ApplicationController
    def studentDashboard
        @dojo = Dojo.find_by(id:params[:dojoid])
        @student= Student.find_by(id:params[:studentid])
        @cohorts= Student.where(dojo: @dojo).where.not(id:params[:studentid])
    end
    def edit
        @dojo = Dojo.find_by(id:params[:dojoid])
        @student= Student.find_by(id:params[:studentid])
        @d = Dojo.all
    end
    def add
        @dojo = Dojo.find_by(id:params[:dojoid])
        @dojos = Dojo.where(id:params[:dojoid])
    end
    def newUser
        # puts params
        # redirect_to "/add/"+params[:dojoid].to_s
        @student = Student.create(student_params)
        redirect_to "/dojoDashboard/" + params[:dojoid].to_s
    end
    def update
        puts params
        @student = Student.find_by(id:params[:studentid])
        @student.update(student_params)
        redirect_to "/dojoDashboard/" + params[:dojoid].to_s
        # @dojo = Dojo.find_by(id:params[:dojoid])
        # @student.save
    end
    def destroy
        @student= Student.find_by(id:params[:studentid])
        # Student.destroy(params[:studentid])
        @student.delete
        redirect_to "/dojoDashboard/" + params[:dojoid].to_s
    end
    private
    def student_params
        params.require(:student).permit(:first_name, :last_name, :email).merge(dojo:Dojo.find(params[:student][:dojo]))
    end
    private
    def init_params
        params.require(:student).permit(:first_name, :last_name, :email).merge(dojo:params[:student][:dojo])
    end
end
