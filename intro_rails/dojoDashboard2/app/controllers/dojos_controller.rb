class DojosController < ApplicationController
    def index
        @dojos = Dojo.all
    end
    def add
    end
    def create
        @dojo = Dojo.create(dojo_params)
        redirect_to "/addHome"
    end
    private
    def dojo_params
        params.require(:dojo).permit(:branch, :street, :city, :state)
    end
end
