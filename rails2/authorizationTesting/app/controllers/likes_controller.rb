class LikesController < ApplicationController
  def index
    redirect_to ("/secrets")
  end
  def create
    @user = User.find_by(id:session['user_id'])
    @secret = Secret.find_by(id:params[:secretid])
    @like = Like.new(user:@user, secret:@secret)
      if @like.valid?
        @like.save
        redirect_to '/secrets/'
      else
      end
  end

  def destroy
    @user = User.find_by(id:session['user_id'])
    @secret = Secret.find_by(id:params[:secretid])
    # if @secret.user.id.to_i == session['user_id']
    @like = @secret.likes.where(user: User.find_by(id:session['user_id']))
    puts @like
    p @like
    unless @user.likes.include? @like == 'false'
      puts "DESTROY SUCCESSFUL********"
      @like.delete @like
      redirect_to "/secrets"
    else
      flash[:notice] = ["You cant delete that secret because it is not yours"]
      puts "DESTROY FAILED********"
      redirect_to "/users/" + @user.id.to_s
    end
    # else
    #   puts "********destroy failed"
    # end
  end
end
