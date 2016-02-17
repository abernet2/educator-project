class UsersController < ApplicationController
  before_action :require_login, only: [:index, :show]
  include ApplicationHelper

  def index
    # @search = current_user.students.search(params[:q])
    # @search = Student.search(params[:q])
    # @students = @search.result
    if session[:user_id]
      @users = User.all
    else
      @error = 'Unauthenticated user'
      redirect_to new_session_path
    end
  end

  def show
    @search = current_user.students.search(params[:q])
    @search = Student.search(params[:q])
    @students = @search.result
    if session[:user_id]
      @user = User.find(params[:id])
      @students = @user.students
    else
      @error = 'Unauthenticated user'
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
      @errors = @user.errors.full_messages
      render 'users/new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :first_name, :last_name, :photo, :password_confirmation, :authentication_token)
  end
end
