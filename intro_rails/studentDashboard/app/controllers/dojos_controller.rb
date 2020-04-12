class DojosController < ApplicationController
    def index
        @dojos = Dojo.all
    end
    def dojoDashboard
        @dojo = Dojo.find_by(id:params[:id])
        @students = Student.where(dojo: @dojo)
    end
end
