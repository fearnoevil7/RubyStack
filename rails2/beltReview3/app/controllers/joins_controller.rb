class JoinsController < ApplicationController
  def create
    puts "*******params*******"
    puts params
    puts "*******params*******"
    p params
    @user = User.find_by(id:session["user_id"])
    @event = Event.find_by(id: params[:eventid])
    @events = Event.all
    if @events.include? @event
      @join = Join.new(user: @user, event: @event)
      if @join.valid?
        @join.save
        puts "*******join*******"
        p @join
        flash[:notice] = ["Successfully joined event!!!!!!!"]
        redirect_to "/events"
      else
        flash[:notice] = ["Unable to join event!!!!!!!"]
        redirect_to "/events"
      end
    else
      flash[:notice] = ["Stop Hacking!!!!!!!"]
      redirect_to "/events"
    end
  end

  def destroy
    puts "*******params*******"
    puts params
    puts "*******params*******"
    p params
    @user = User.find_by(id: session['user_id'])
    @event = Event.find_by(id: params[:eventid])
    @events = Event.all
    if @events.include? @event
      @join = @event.joins.find_by(user: User.find_by(id: session["user_id"]))
      if @user.joins.include? @join 
        @join.destroy
        flash[:notice] = ["successfully canceled"]
        redirect_to "/events"
      else
        flash[:notice] = ["unable to cancel"]
        redirect_to "/events"
      end
    else
      flash[:notice] = ["Stop Hacking!!!!!!!"]
      redirect_to "/events"
    end
  end
end
