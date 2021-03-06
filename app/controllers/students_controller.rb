class StudentsController < ApplicationController
  before_action :require_login

  def index
    @search = Student.search(params[:q])
    @students = @search.result
    respond_to do |format|
      format.html
      format.csv { send_data @students.to_csv }
      format.xlsx { send_data @students.to_xlsx.to_stream.read }
    end
  end

  def show
    @student = Student.find(params[:id])
  end

  def update_detentions
    @student = Student.find(params[:id])
    detentions = [0, @student.detentions + params[:student][:detentions].to_i].max
    @student.update_attributes(detentions: detentions)
    respond_to do |format|
      if @student.save
        format.html { redirect_to student_path }
        format.js { }
      end
    end
  end

  def update_grade
    @student = Student.find(params[:id])
    @student.update_attributes(grade: @student.grade + params[:student][:grade].to_i)
    respond_to do |format|
      if @student.save
        format.html { redirect_to student_path }
        format.js { }
      end
    end
  end

  def update_gpa
    @student = Student.find(params[:id])
    @student.update_attributes(gpa: @student.gpa + params[:student][:gpa].to_f)
    respond_to do |format|
      if @student.save
        format.html { redirect_to student_path }
        format.js { }
      end
    end
  end

  def update_teacher
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
