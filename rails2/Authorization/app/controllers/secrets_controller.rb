class SecretsController < ApplicationController
  def index
    # p params[:userid].to_i
    # p session['user_id']
    # puts "Test"
    @user = User.find_by(id:session['user_id'])
    @secrets = Secret.all
    # puts params[:userid].to_i
    # puts session['user_id']
  end
  def create
    @secret = Secret.new(secret_params)
    if @secret.valid?
      @secret.save
      redirect_to "/users/" + params[:userid].to_s
    else
      redirect_to "/sessions/new"
    end
  end
  def destroy
    @secret = Secret.find_by(id:params[:secretid])
    if @secret.user == current_user
      @secret.destroy
      # puts params[:userid].to_i "param"
      # puts "param"
      # puts session['user_id'].to_s
      # puts "test"
      # puts "message would have deleted"
      flash[:notice] = ["Message successfully deleted"]
      redirect_to "/users/" + session["user_id"].to_s
    else
      flash[:notice] = ["Message could not be deleted"]
      redirect_to "sessions/new"
    end
  end
  private
  def secret_params
    params.require(:secret).permit(:content).merge(user: current_user)
  end
  # def verify
  #   puts params[:userid].to_i
  #   puts "param"
  #   puts session['user_id']
  #   puts "session"
  #   # @user_that_created_secret = Secret.find_by(id:params[:secretid]).user
  #   @secret = Secret.find_by(id: params[:secretid])
  #   puts @user_that_created_secret.name
  #   puts @user_that_created_secret.class
  #   puts @user_that_created_secret.id
  #   puts "user that created secret"
  #   puts @user_that_created_secret.is_a? String
  #   if @secret.user != session['user_id']
  #     redirect_to "/logout"
  #   else
  #     flash[:notice] = ["Unable to delete secret"]
  #     redirect_to "/users/" + session['user_id'].to_s
  #   end
  # end
end
