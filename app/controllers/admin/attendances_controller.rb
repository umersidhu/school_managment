class Admin::AttendancesController < Admin::BaseController

  before_action :find_section, :find_branch, :find_attendance, :show_attendances

  def index
    @month_dates = (Time.now.beginning_of_month.to_date..Time.now.end_of_month.to_date).map{ |date| date }
  end

  def previous_month_dates
    end_month    = (params[:current_month].to_date - 1.day)
    start_month  = end_month.beginning_of_month
    @month_dates = (start_month.to_date..end_month.to_date).map{ |date| date }
    respond_to do |format|
      format.js
    end
  end

  def next_month_dates
    current_month = (params[:current_month].to_date)
    start_month = (current_month.end_of_month + 1.day)
    end_month    = start_month.end_of_month
    if (start_month > Time.now.to_date)
      @month_dates = (Time.now.beginning_of_month.to_date..Time.now.end_of_month.to_date).map{ |date| date }
    else
      @month_dates = (start_month.to_date..end_month.to_date).map{ |date| date }
    end
    respond_to do |format|
        format.js
      end
  end

  def new
    @students = @section.students
    @attendances = []

    @students.each do |student|
      @attendances << Attendance.new(user_id: student.id, section_id: @section.id, attendance_date: params[:month_date])
    end

  end

  def create
    attendances = []
    params[:attendances].each do |attendance|
      attendances << Attendance.new(user_id: attendance[:user_id], section_id: @section.id, attendance_date: attendance[:attendance_date], status: attendance[:status] )
    end
    Attendance.import attendances
    redirect_to admin_branch_class_section_attendances_path(@branch_class, @section)
  end

  def edit
  end

  def update
    if @attendance.update(attendance_params)
      redirect_to admin_branch_class_section_attendances_path(@branch_class, @section)
    else
      render :edit
    end
  end

  def show_attendances
    @attendances = @section.attendances.where(attendance_date: params[:month_date])
  end

  private

  def find_branch
    @branch_class = BranchClass.friendly.find(params[:branch_class_id])
  end

  def find_section
    @section = Section.find_by(id: params[:section_id])
  end

  def find_attendance
    @attendance = Attendance.find_by_id(params[:id])
  end

  def attendance_params
    params.require(:attendance).permit(:user_id, :section_id, :status, :attendance_date)
  end
  
end
