class VisitorsController < ApplicationController

  def index
    check_admin
  end

  def check_admin
  	unless current_user.student?
  		redirect_to admin_root_path
  	end
  end
  
end
