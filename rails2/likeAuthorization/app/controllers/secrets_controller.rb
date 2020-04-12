class SecretsController < ApplicationController
  before_action :verify, only: [:destroy]
  def index
    @user = User.find_by(id:session['user_id'])
    @secrets = Secret.all
  end
  def create
    if params[:userid].to_i == session['user_id']
      @secret = Secret.new(secret_params)
      if @secret.valid?
        @secret.save
        redirect_to "/users/" + params[:userid].to_s
      else
        puts "*******failed"
        flash[:notice] = ["cannot create secret"]
        redirect_to 'sessions/new'
      end
    else
      puts params[:userid]
      puts session["user_id"]
      puts params[:userid]
      puts params[:userid].is_a? String
      puts "******* userid != session"
    end
  end
  def destroy
    @secret = Secret.find_by(id: params[:secretid])
    @secret.destroy
    puts "message would have deleted"
    flash[:notice] = ["Message successfully deleted"]
    redirect_to "/users/" + session["user_id"].to_s
  end
  private
  def secret_params
    params.require(:secret).permit(:content).merge(user: User.find_by(id: session["user_id"]))
  end
  private
  def verify
    @user_that_created_secret = Secret.find_by(id:params[:secretid]).user
    if @user_that_created_secret.id.to_i != session['user_id']
      flash[:notice] = ["Unable to delete secret"]
      redirect_to "/logout"
    else
      puts "success"
    end
  end
end
