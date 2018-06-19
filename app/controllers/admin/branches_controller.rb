class Admin::BranchesController < Admin::BaseController
  before_action :check_super_admin
	before_action :find_branch, only: [:edit, :update, :destroy, :show]
  before_action :active_schools, only: [:new, :edit]
	
  def index
    @branches = Branch.all
  end

  def show
    @owner = @branch.users.school_admin if @branch.users.school_admin.present?
  end

  def new
  	@branch = Branch.new
  end

  def create
  	@branch = Branch.new(branch_params)
  	if @branch.save
  		flash[:notice] = "#{ @branch.branch_name} Branch Created Successfully"
  		redirect_to admin_branches_path
  	else
      @schools = School.active
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @branch.update(branch_params)
  		flash[:notice] = "#{ @branch.branch_name} Branch Update Successfully"
  		redirect_to admin_branches_path
  	else
  		render 'new'
  	end
  end

  def destroy
  	if @branch.destroy
  		flash[:notice] = "#{ @branch.branch_name} Branch Deleted Successfully"
		else
			flash[:alert] = "Unable to delete branch #{ @branch.branch_name}"
		end
		redirect_to admin_branches_path
  end

  private

  def find_branch
  	@branch = Branch.find_by(id: params[:id])
  end

  def branch_params
  	params.require(:branch).permit(:school_id, :cover, :branch_name, :city, :address, :status)
  end

  def active_schools
    @schools = School.active
  end
end
