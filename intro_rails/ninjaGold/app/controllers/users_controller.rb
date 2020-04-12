class UsersController < ApplicationController
    def index
        unless session[:amount]
            session[:amount] = 0
        end
    end
    def transaction
        session['building'] = params[:facility]
        if session['building'] == 'farm'
            puts(session['building'])
            currensy = rand(10..20)
            request.session['amount'] += currensy
            redirect_to ""
        end
        if session['building'] == 'cave'
            puts(session['building'])
            currensy = rand(5..10)
            request.session['amount'] += currensy
            redirect_to ""
        end
        if session['building'] == 'house'
            puts(session['building'])
            currensy = rand(2..5)
            request.session['amount'] += currensy
            redirect_to ""
        end
        if session['building'] == 'casino'
            puts(session['building'])
            currensy = rand(-50..50)
            request.session['amount'] += currensy
            redirect_to ""
        end
    end
end
