class StudentsController < ApplicationController
  def index
    @students = Student.all

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "students_list",
               template: "students/pdf",
               formats: [:html],
               locals: { students: @students }
      end
    end
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path, notice: 'Student was successfully created.'
    else
      render :new
    end
  end

  def import
    Student.import(params[:file])
    redirect_to root_url, notice: 'Students imported successfully.'
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :age, :gender, :address, :phone_number, :admission_date, :file)
  end
end
