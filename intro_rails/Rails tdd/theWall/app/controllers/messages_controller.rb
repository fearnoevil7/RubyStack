class MessagesController < ApplicationController
  def new
  end
  def index
    @user = User.find_by(id:session['user_id'])
    @messages = Message.all
  end
  def create
  @user = User.find_by(id:session['user_id'])
  @message = Message.create(message_params)
    if @message.valid?
      flash[:notice] = ["Message successfully created"]
      redirect_to "/messages/" + session['user_id'].to_s
    else
      puts @message.errors.full_messages
      flash[:notice] = @message.errors.full_messages
      redirect_to "/messages/"+@user.id.to_s
    end
  end
  private
  def message_params
    params.require(:message).permit(:message).merge(user:User.find_by(id:params[:userid]))
  end
end
