class LikesController < ApplicationController
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
    @like = @secret.likes.where(user: User.find_by(id:session['user_id']))
    puts @like
    unless @user.likes.include? @like == 'false'
      puts "DESTROY SUCCESSFUL********"
      @like.delete @like
      redirect_to "/secrets"
    else
      flash[:notice] = ["You cant delete that secret because it is not yours"]
      redirect_to "/users/" + @user.id.to_s
    end
  end
end
