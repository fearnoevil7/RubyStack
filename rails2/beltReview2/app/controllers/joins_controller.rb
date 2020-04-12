class JoinsController < ApplicationController
    def create
        @user = User.find_by(id: session["user_id"])
        @event = Event.find_by(id: params[:eventid])
        @join = Join.new(user:@user, event:@event)
        if @join.valid?
            puts "*******Join successfully"
            p @join
            @join.save
            redirect_to "/events"
        else
            puts "*******join failed"
            redirect_to "/events"
        end
    end
    def destroy
        @user = User.find_by(id: session["user_id"])
        @event = Event.find_by(id: params[:eventid])
        @join = @event.joins.find_by(user:@user)
        unless @user.joins.include? @join == "false"
            p @join
            puts "*******DESTROY SUCCESSFUL"
            @join.delete #@join
            redirect_to "/events"
        else
            flash[:notice] = ["You cannot unjoin"]
            puts "DESTROY FAILED"
            redirect_to "/users/new"
        end
    end
end
