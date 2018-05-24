class Admin::StudentSectionsController < Admin::BaseController
  before_action :find_class_branch, :find_section, only: [:new, :index, :section_students, :create]

  def index
  end

  def new
    user_ids = @class_section.users.pluck(:id)
    @students = current_user.branch.users.students.where.not(id: user_ids)
    @student_section = StudentSection.new
    respond_to do |format|
      format.js
    end
  end

  def create
    students = []
    students_id = params[:student_section][:user_id]&.reject(&:blank?)
    students_id.each do |student_id|
      students << StudentSection.new(user_id: student_id, section_id: params[:section_id])
    end
    StudentSection.import students
    respond_to do |format|
      format.js
    end
  end

  def section_students
  end
    
  def find_class_branch
    @branch_class = BranchClass.friendly.find(params[:branch_class_id])
  end

  def find_section
    @class_section = Section.find_by(id: params[:section_id])
  end

end
