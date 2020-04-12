class SecretsController < ApplicationController
  def index
    @user = User.find_by(id: session["user_id"])
    @secrets = Secret.all
  end
  def create
    @secret = Secret.new(secret_params)
    if @secret.valid?
      @secret.save
      puts "*******secret*******"
      p @secret
      flash[:notice] = ["Secret created!!!!!!!!"]
      redirect_to "/users/show/" + session["user_id"].to_s
    else
      if @secret.errors
        flash[:notice] = @secret.errors.full_messages
        redirect_to "/users/show" + session["user_id"].to_s
      else
        flash[:notice] ["secret failed to create"]
        redirect_to "/users/show" + session["user_id"].to_s
      end
    end
  end
  def destroy
    @secret = Secret.find_by(id: params[:secretid])
    if @secret
      @secret.destroy
      redirect_to "/users/show/" + session["user_id"].to_s
    else
      flash[:notice]=["unable to destroy"]
      redirect_to "/users/show/" + session["user_id"].to_s
    end
  end
  private
  def secret_params
    params.require(:secret).permit(:content).merge(user: User.find_by(id: session["user_id"]))
  end
end
