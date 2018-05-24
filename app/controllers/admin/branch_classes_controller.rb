class Admin::BranchClassesController < Admin::BaseController
  before_action :check_admin
  before_action :find_branch_class, only: [:edit, :update, :destroy, :show]
  
  def index
    @branch_classes = current_user.branch.branch_classes
  end

  def show
  end

  def new
    @branch_class = BranchClass.new
  end

  def create
    @branch_class = BranchClass.new(branch_class_params)
    @branch_class.branch_id = current_user.branch.id
    if @branch_class.save
      flash[:notice] = "#{ @branch_class.name} Class Created Successfully"
      redirect_to admin_branch_classes_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @branch_class.update(branch_class_params)
      flash[:notice] = "#{ @branch_class.name} Class Update Successfully"
      redirect_to admin_branch_classes_path
    else
      render 'new'
    end
  end

  def destroy
    if @branch_class.destroy
      flash[:notice] = "#{ @branch_class.name} Branch Deleted Successfully"
    else
      flash[:alert] = "Unable to delete branch_class #{ @branch_class.name}"
    end
    redirect_to admin_branch_classes_path
  end

  private

  def find_branch_class
    @branch_class = BranchClass.friendly.find(params[:id])
  end

  def branch_class_params
    params.require(:branch_class).permit(:name, :section)
  end
end
