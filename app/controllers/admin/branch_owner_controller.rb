class Admin::BranchOwnerController < Admin::BaseController
  before_action :find_branch, only: [:new]

  def new
    
  end

  def find_branch
    @branch = Branch.find_by(id: params[:id])
  end
end
