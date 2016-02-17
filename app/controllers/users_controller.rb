class UsersController < ApplicationController
  before_action :require_login, only: [:index, :show]
  include ApplicationHelper

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @students = @user.students
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
