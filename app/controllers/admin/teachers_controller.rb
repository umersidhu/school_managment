class Admin::TeachersController < Admin::BaseController
  before_action :find_teacher,  only: [:edit, :update, :destroy]
  #before_action :check_school_admin_exist, only: [:new]
  
  def index
    @teachers = current_user.branch.users.teachers
  end

  def new
    @teacher = User.new
  end

  def edit
  end


  def create
    @teacher = User.new(user_params)
    @teacher.branch_id = current_user.branch.id 
    if @teacher.save
      flash[:notice] = "#{@teacher.first_name} Created successfully"
      redirect_to admin_teachers_path
    else
      render 'new'
    end
  end

  def update
    if @teacher.update(user_params)
      flash[:notice] = "#{@teacher.first_name} successfully edited"
      redirect_to admin_teachers_path
    else
      render 'edit'
    end
  end

  def destroy
    if @techer.destroy
      flash[:notice] = "#{@techer.first_name} successfully deleted"
    else
      flash[:notice] = "Unable to delete #{@techer.first_name} "
    end
      redirect_to admin_techers_path
  end
  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :mobile_number, :email, :password, :password_confirmation, :role, :status)
  end

  def find_teacher
    @teacher = User.find_by(id: params[:id])
  end

  #def check_school_admin_exist
    #if @branch.user.present?
      #flash[:notice] = "School admin alredy Assigned to #{@branch.branch_name}"
      #redirect_to admin_branches_path
    #end
  #end
end
