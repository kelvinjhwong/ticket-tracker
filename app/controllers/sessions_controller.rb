class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:email]).first

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = 'Welcome back!'
      redirect_to projects_path
    else
      flash[:error] = 'You could not be logged in.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'You have been logged out.'
    redirect_to root_path
  end
end
