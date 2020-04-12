class SessionsController < ApplicationController
  def create
    @user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
    if @user
      session['user_id'] = @user.id
      redirect_to '/events'
    else
      puts "user p"
      puts params
      p @user = User.find_by_email(params[:user][:email])
      puts "user puts"
      puts @user = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
      puts 'login failed'
      flash[:notice] = ['Invalid Combination']
      redirect_to '/users/new'
    end
  end

  def destroy
    puts session['user_id']
    reset_session
    redirect_to '/users/new'
  end
end
