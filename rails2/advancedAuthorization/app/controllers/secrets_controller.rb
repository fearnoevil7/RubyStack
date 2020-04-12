class SecretsController < ApplicationController
  def index
    @user = User.find_by(id:session['user_id'])
    @secrets = Secret.all
  end
  def create
    @secret = Secret.new(secret_params)
    if @secret.valid?
      @secret.save
      redirect_to "/users/" + params[:userid].to_s
    end
  end
  def destroy
    @secrets = Secret.where(id:params[:secretid])
    unless @secrets.empty?
      @secrets.each do |secret|
        secret.destroy
        puts "message would have deleted"
      end
      flash[:notice] = ["Message successfully deleted"]
      redirect_to "/users/" + session["user_id"].to_s
    else
      flash[:notice] = ["Unable to delete secret"]
      redirect_to "/users/" + session['user_id'].to_s
    end
  end
  private
  def secret_params
    params.require(:secret).permit(:content).merge(user:User.find(session["user_id"]))
  end
end
