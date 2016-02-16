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
    @teacher = User.find(session[:user_id])      
    respond_to do |format|
      if @student.save
        format.html { redirect_to student_path }
        format.js {  }
      end
    end
  end
end
