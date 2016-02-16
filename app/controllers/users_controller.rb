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

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name)
  end

end