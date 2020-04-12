class CommentsController < ApplicationController
  def create
    puts "*******createparams*******"
    p params
    puts "*******params*******"
    puts params
    @events = Event.all
    @event = Event.find_by(id: params[:eventid])
    if @events.include? @event
      @comment = Comment.new(comment_params)
      if @comment.valid?
        @comment.save
        flash[:notice] = ["Comment successfully created"]
        redirect_to "/events/" + @event.id.to_s
      else
        flash[:notice] = @comment.errors.full_messages
        redirect_to "/events/" + @event.id.to_s
      end
    else
      flash[:notice] = ["stop trying to hack"]
      redirect_to "/events"
    end
  end

  def destroy
  end
  private
  def comment_params
    puts "*******commentparams*******"
    p params
    puts "*******params*******"
    puts params
    params.require(:comment).permit(:content).merge(user: User.find_by(id: session["user_id"]), event: Event.find_by(id: params[:eventid]))
  end
end