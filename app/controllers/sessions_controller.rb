class SessionsController < ApplicationController
  before_action :require_logout, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(:username => params[:username])
    if(user && user.valid?)
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      @errors = ["Invalid username or password"]
      render 'sessions/new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end


end
