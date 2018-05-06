class Admin::DashboardsController < Admin::BaseController
  
  def index 
  	@schools = School.count
  	@branches = Branch.count
  end
  
end
