class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :activate]
  
  def index
    @students = Student.all
  end

  def show
    if @student.active == false 
      @active = "inactive"
    else
      @active = "active"
    end
  end

  def activate
    if @student.active == false 
      @student.active = true
    else 
      @student.active = false 
    end
    @student.save
    redirect_to @student
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end