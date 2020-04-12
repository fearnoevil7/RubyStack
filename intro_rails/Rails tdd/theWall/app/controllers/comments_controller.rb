class CommentsController < ApplicationController
    def new
    end
    def create
    @user = User.find_by(id:params[:userid])
    @message = Message.find_by(id:params[:messageid])
    @comment = Comment.create(comment_params)
        if @comment.valid?
            flash[:notice] = ["Comment successfully created"]
            redirect_to "/messages/" + params[:messageid].to_s
        else
            flash[:notice] = ['cannot create comment']
            redirect_to "/messages/" + session['user_id'].to_s
        end
    end
    private
    def comment_params
        params.require(:comment).permit(:comment).merge(user:User.find_by(id:session['user_id'])).merge(message:Message.find_by(id:params[:messageid]))
    end
end
