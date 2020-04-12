class DojosController < ApplicationController
    def index
        @dojos = Dojo.all
    end
    def add
        @dojo = Dojo.create(dojo_params)
        redirect_to ""
    end
    def configure
        @dojo = Dojo.find_by(id:params[:id])
    end
    def show
        @dojo = Dojo.find_by(id:params[:id])
    end
    def trash
        @dojo = Dojo.find_by(id:params[:id])
        @dojo.delete
        @dojo.save
        redirect_to ""
    end
    def update
        @dojo = Dojo.find_by(id:params[:id])
        @dojo.update(dojo_params)
        redirect_to ""
    end
    private
    def dojo_params
        params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
