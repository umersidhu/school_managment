class Admin::StudentsController < Admin::BaseController
  before_action :find_student,  only: [:edit, :update, :destroy]
  #before_action :check_school_admin_exist, only: [:new]
  
  def index
    @students = current_user.branch.users.students
  end

  def new
    @student = User.new
  end

  def edit
  end


  def create
    @student = User.new(user_params)
    @student.branch_id = current_user.branch.id 
    if @student.save
      flash[:notice] = "#{@student.first_name} Created successfully"
      redirect_to admin_students_path
    else
      render 'new'
    end
  end

  def update
    if @student.update(user_params)
      flash[:notice] = "#{@student.first_name} successfully edited"
      redirect_to admin_students_path
    else
      render 'edit'
    end
  end

  def destroy
    if @student.destroy
      flash[:notice] = "#{@student.first_name} successfully deleted"
    else
      flash[:notice] = "Unable to delete #{@student.first_name} "
    end
      redirect_to admin_students_path
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :mobile_number, :email, :password, :password_confirmation, :role, :status)
  end

  def find_student
    @student = User.find_by(id: params[:id])
  end

  def check_school_admin_exist
    if @branch.user.present?
      flash[:notice] = "School admin alredy Assigned to #{@branch.branch_name}"
      redirect_to admin_branches_path
    end
  end
end
