class StudentsController < ApplicationController

  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.update_attributes(teacher_id: session[:user_id])
    @student.save
    redirect_to student_path
  end
end
