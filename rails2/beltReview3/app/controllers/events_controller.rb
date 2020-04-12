class EventsController < ApplicationController
  def index
    @user = User.find_by(id:session["user_id"])
    @events = Event.all
  end

  def show
    @user = User.find_by(id: session["user_id"])
    @events = Event.all
    @event = Event.find_by(id: params[:eventid])
    if @events.include? @event
      @number_of_people_who_joined = @event.joins
      @attendees = @event.users_joining
      @comments = @event.comments
    else
      flash[:notice] = ["Stop hacking"]
      redirect_to '/events'
    end
  end
  
  def create
    @user = User.find_by(id:session['user_id'])
    @event = Event.new(event_params)
    if @event.valid?
      @event.save
      flash[:notice] = ["Event created!!!!!!!"]
      redirect_to "/events"
    else
      flash[:notice] = @event.errors.full_messages
      redirect_to "/events"
    end
  end

  def destroy
    puts "*******params*******"
    puts params
    puts "*******params*******"
    p params
    @events = Event.all
    @event = Event.find_by(id:params[:eventid])
    if @events.include? @event
      @event.destroy
      flash[:notice] = ["event successfully deleted"]
      redirect_to "/events"
    else
      flash[:notice] = ["Stop hacking"]
      redirect_to '/events'
    end
  end
  private
  def event_params
    params.require(:event).permit(:name, :date, :location, :state).merge(user: User.find_by(id:session["user_id"]))
  end
end
