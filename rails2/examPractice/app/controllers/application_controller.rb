class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize


  private
  def logged?
    @user = User.find_by(id:session["user_id"])
    !@user.nil?
  end
  def authorize
    p logged?
    unless logged?
      flash[:notice] = ["stop hacking"]
      p "j;kljijojoihlhklhkl"
      redirect_to '/'
    end
  end
end
