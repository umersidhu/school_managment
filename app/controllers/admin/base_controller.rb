class Admin::BaseController < ApplicationController
  before_action :check_admin
  layout 'admin'

  def check_admin
    unless current_user.admin? || current_user.school_admin?
      flash[:alert] = "Unauthorized access"
      redirect_to root_path
    end
  end

  def check_super_admin
    unless current_user.admin?
      flash[:alert] = "Unauthorized access"
      redirect_to root_path
    end
  end
end
