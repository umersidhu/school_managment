class Admin::UsersController < Admin::BaseController
  before_action :find_branch, only: [:new, :create, :edit, :update]
  before_action :find_owner,  only: [:edit, :update]
  before_action :check_school_admin_exist, only: [:new]
  
  def index
    if current_user.admin?
      @users = User.school_admins
    else
      
    end  
  end

  def new
    @branch_owner = User.new
  end

  def edit
  end

  def update
    user_params.merge(branch_id: @branch.id)
    if @branch_owner.update(user_params)
      flash[:notice] = "#{@branch_owner.first_name} successfully edited for #{ @branch.branch_name}"
      redirect_to admin_branches_path
    else
      render 'edit'
    end
  end

  def create
    @branch_owner = User.new(user_params)
    @branch_owner.branch_id = @branch.id 
    if @branch_owner.save
      flash[:notice] = "#{@branch_owner.first_name} assigned as school admin of #{ @branch.branch_name}"
      redirect_to admin_branches_path
    else
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :mobile_number, :email, :password, :password_confirmation, :role, :status)
  end

  def find_branch
    @branch = Branch.find_by(id: params[:branch_id])
  end

  def find_owner
    @branch_owner = User.find_by(id: params[:id])
  end

  def check_school_admin_exist
    if @branch.user.present?
      flash[:notice] = "School admin alredy Assigned to #{@branch.branch_name}"
      redirect_to admin_branches_path
    end
  end
end
