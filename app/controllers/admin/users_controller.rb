class Admin::UsersController < Admin::BaseController
  before_action :find_branch, only: [:new, :create, :edit, :update]

  def new
    @branch_owner = User.new
  end

  def edit
    
  end

  def update
    
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
    params.require(:user).permit(:first_name, :last_name, :mobile_number, :email, :password, :password_confirmation, :role)
  end

  def find_branch
    @branch = Branch.find_by(id: params[:branch_id])
  end
end
