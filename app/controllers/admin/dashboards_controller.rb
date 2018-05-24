class Admin::DashboardsController < Admin::BaseController
  
  def index 
  	@schools  = School.count
  	@branches = Branch.count
    @admins   = User.school_admins.count
    @students = current_user&.branch&.users&.students&.count
  end
  
end
