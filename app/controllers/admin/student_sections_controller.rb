class Admin::StudentSectionsController < Admin::BaseController
  before_action :find_class_branch, :find_section, only: [:new, :index, :section_students, :create, :destroy, :students_permotion]

  def index
  end

  def new
    user_ids = @class_section.students.pluck(:id)
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

  def destroy
    ss = StudentSection.find_by(id: params[:id])
    if ss.present?
      ss.destroy
    else
      flash[:notice] = "Couldn't delete the student"
    end
    redirect_to section_students_admin_branch_class_section_student_sections_path(@branch_class, @class_section)
  end

  def section_students
  end

  def students_permotion
  end

  private
    
  def find_class_branch
    @branch_class = BranchClass.friendly.find(params[:branch_class_id])
  end

  def find_section
    @class_section = Section.find_by(id: params[:section_id])
  end

end
