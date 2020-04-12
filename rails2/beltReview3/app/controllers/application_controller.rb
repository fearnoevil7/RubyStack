class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authorize, except: [:create, :new]
  private
  def logged?
    !session["user_id"].nil?
  end
  def authorize
    unless logged?
      # flash[:notice] = "Must be logged in to view"
      redirect_to "/"
    end
  end
end




