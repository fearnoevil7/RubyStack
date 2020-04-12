class UsersController < ApplicationController
    def index
    end
    def hello
    end
    def tiempo
        if session[:count]
            session[:count] += 1
        else
            session[:count] = 1
        end
    end
    def restart
        session.clear
        render text: "Destroyed the session!"
    end
    def hi
        redirect_to "/say/hello/joe"
    end
end
