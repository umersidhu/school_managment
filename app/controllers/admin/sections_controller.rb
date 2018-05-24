class Admin::SectionsController < Admin::BaseController
  before_action :check_admin
  before_action :find_branch_class
  before_action :find_section, only: [:edit, :update, :destroy, :show]
  
  def index
    @sections = @branch_class.sections
  end

  def show
  end

  def new
    @section = Section.new
  end

  def create
    @section = Section.new(section_params)
    @section.branch_class_id = @branch_class.id
    if @section.save
      flash[:notice] = "#{ @section.section} of Class #{@branch_class.name} Created Successfully"
      redirect_to admin_branch_classes_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @section.update(section_params)
      flash[:notice] = "#{ @section.section} of Class #{@branch_class.name} Update Successfully"
      redirect_to admin_branch_classes_path
    else
      render 'edit'
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
    @branch_class = BranchClass.friendly.find(params[:branch_class_id])
  end

  def find_section
  	@section = Section.find_by(id: params[:id])
  end

  def section_params
    params.require(:section).permit(:branch_class_id, :section)
  end
end
