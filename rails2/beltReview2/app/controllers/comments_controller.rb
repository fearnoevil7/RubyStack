class CommentsController < ApplicationController
  def create
    puts "********This is my params"
    p params
    @comment = Comment.new(comment_params)
    if @comment.valid?
      p @comment
      puts "*******comment successfully created"
      @comment.save
      redirect_to "/events/" + params[:eventid] + "/show"
    end
  end

  def destroy
  end
  private
  def comment_params
    params.require(:comment).permit(:content).merge(user: User.find_by(id: session["user_id"]), event: Event.find_by(id: params[:eventid]))
  end
end
