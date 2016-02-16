class UsersController < ApplicationController
	
	def index
    if(session[:user_id])
  		@users = User.all
    else
      @error = "Unauthenticated user"
      redirect_to new_session_path
    end
	end

  def show
    if(session[:user_id])
      @user = User.find(params[:id])
      @students = @user.students
    else
      @error = "Unauthenticated user"
      redirect_to new_session_path
    end
  end

end