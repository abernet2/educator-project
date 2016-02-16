class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(:username => params[:username])
    if(user.valid?)
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
