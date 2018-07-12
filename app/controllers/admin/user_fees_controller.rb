class Admin::UserFeesController < Admin::BaseController
  before_action :find_branch_class, :find_class_section

  def index
    @months = []
    prev_date = "January 2018"
    m = Date.strptime(prev_date,"%B %Y")
    n = Date.today
    n -= n.day - 1
    while m <= n
      @months << "#{Date::MONTHNAMES[m.month].ljust(8)} #{m.year}"
      m = m >> 1
    end
  end

  def new
    @students = @section.students
    @user_feeses = []
    @students.each do |student_fee|
      unless student_fee.user_fee&.pluck(:month).include? params[:year_month].to_date
        @user_feeses << UserFee.new(user_id: student_fee.id, fee_id: @branch_class.fee.id, month: params[:year_month].to_date)
      end
    end
  end

  def create
    user_feeses = []
    params[:user_feeses].each do |user_fee|
      user_feeses << UserFee.new(user_id: user_fee[:user_id], fee_id: @branch_class.fee.id, month: user_fee[:fee_month], status: user_fee[:status])
    end
    UserFee.import user_feeses
    redirect_to admin_branch_class_section_user_fees_path(@branch_class, @section)
  end

  def edit
    
  end

  def fee_months
    
  end

  private

  def find_branch_class
    @branch_class = BranchClass.friendly.find(params[:branch_class_id])
  end

  def find_class_section
    @section = Section.find_by(id: params[:section_id])
  end
end
