class EventsController < ApplicationController
  def show
    @user = User.find_by(id: session[:user_id])
    @event = Event.find_by(id:params[:eventid])
    @joins = @event.joins
    @users_joining = @event.users_that_joined.all
    @comments = @event.comments
  end

  def index
    @user = User.find_by(id:session['user_id'])
    @events = Event.all
  end
  def create
    @event = Event.new(event_params)
    if @event.valid?
      # unless @event.date.wday <= Date.today.wday || @event.date.mon < Date.mon || @event.date.year < Date.year
      puts "*******events successfully to created"
      flash[:notice] = ['event added']
      @event.save
      redirect_to "/events"
      # else
      #   flash[:notice] = ['event added must be at a future date']
      #   redirect_to "/events"
      # end
    else
      puts "*******events failed to create"
      flash[:notice] = @event.errors.full_messages
      redirect_to "/events"
    end
  end
  def destroy
    @event = Event.find_by(id: params[:eventid])
    @event.destroy
    puts "*******event would have deleted"
    flash[:notice] = ["event successfully deleted"]
    redirect_to "/events"
  end
  private
  def event_params
    params.require(:event).permit(:name, :date, :location, :state).merge(user: User.find_by(id: session['user_id']))
  end
end
