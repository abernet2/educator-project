class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to root_path
    end
  end

  def require_logout
    if logged_in?
      flash[:error] = "You must sign out before you can register or login"
      redirect_to @user 
    end
      
  end

  def logged_in?
    @user = User.find_by(id: session[:user_id])
    !@user.nil?
  end
end
