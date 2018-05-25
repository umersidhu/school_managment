class Admin::TeachingSubjectsController < Admin::BaseController
  before_action :find_class_branch, :find_section, only: [:new, :index, :section_students, :create]

  def index
  	@teachers = @class_section.teachers
  end

  def new
    @subjects = @branch_class.subjects
    user_ids = @class_section.teachers.pluck(:id)
    @teachers = current_user.branch.users.teachers.where.not(id: user_ids)
    @teacher_section = TeachingSubject.new
    respond_to do |format|
      format.js
    end
  end

  def create
    debugger
    @teaching_subjects = TeachingSubject.new(teaching_subjects_params)
    @teaching_subjects.section_id =  params[:section_id]
    if @teaching_subjects.save
      respond_to do |format|
        format.js
      end
    else
      render 'new'
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

  def teaching_subjects_params
    params.require(:teaching_subject).permit(:user_id, :subject_id)
  end

end
