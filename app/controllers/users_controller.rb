class UsersController < ApplicationController
	
	def index
		@users = User.all
	end

  def show
    if(session[:user_id])
      @user = User.find(params[:id])
      @students = @user.students
    else
      @error = "Unauthenticated user"
      redirect_to root_path
    end
  end

end