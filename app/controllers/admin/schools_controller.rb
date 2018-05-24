class Admin::SchoolsController < Admin::BaseController
  before_action :check_super_admin
	before_action :find_school, only: [:edit, :update, :destroy]
  def index
    @schools = School.all
  end

  def new
  	@school = School.new
  end

  def create
  	@school = School.new(school_params)
  	if @school.save
  		flash[:notice] = "#{ @school.name} School Created Successfully"
  		redirect_to admin_schools_path
  	else
  		render 'new'
  	end
  end

  def edit
  end

  def update
  	if @school.update(school_params)
      @school.branches.update_all(status: @school.status)
  		flash[:notice] = "#{ @school.name} School Update Successfully"
  		redirect_to admin_schools_path
  	else
  		render 'new'
  	end
  end

  def destroy
  	if @school.destroy
  		flash[:notice] = "#{ @school.name} School Deleted Successfully"
		else
			flash[:alert] = "Unable to delete school #{ @school.name}"
		end
		redirect_to admin_schools_path
  end


  private

  def find_school
  	@school = School.find_by(id: params[:id])
  end

  def school_params
  	params.require(:school).permit(:name, :status)
  end
end
