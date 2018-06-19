class Admin::SectionSubjectsController < Admin::BaseController
  before_action :find_branch_class, :find_section, :find_section_subject_test
  before_action :find_section_subject, only: [:destroy]
  def index
    @section_subjects = @section.section_subjects.includes(:subject)
  end

  def new
    subjects_id = @section.subjects.pluck(:id)
    @subjects = @branch_class.subjects.where.not(id: subjects_id)
    @section_subject = SectionSubject.new
    respond_to do |format|
      format.js
    end
  end

  def create
    @section_subjects = @section.section_subjects.includes(:subject)
    subjects = []
    subjects_id = params[:section_subject][:subject_id].reject(&:blank?)
    subjects_id.each do |subject_id|
      subjects << SectionSubject.new(subject_id: subject_id, section_id: params[:section_id])
    end
    SectionSubject.import subjects
    respond_to do |format|
      format.js
    end
  end

  def subject_section
  end

  def destroy
    if @section_subject&.destroy
      flash[:notice] = "Subject Deleted Successfully"
    else
      flash[:alert] = "Unable to delete subject"
    end
    redirect_to admin_branch_class_section_section_subjects_path(@branch_class, @section)
  end

  private

  def find_section_subject
    @section_subject = SectionSubject.find_by_id(params[:id])
  end

  def find_section
    @section = Section.find_by(id: params[:section_id])
  end

  def find_branch_class
    @branch_class = BranchClass.friendly.find(params[:branch_class_id])
  end

  def find_section_subject_test
    @section_subject_test = SectionSubjectTest.find_by_id(params[:section_subject_test_id])
  end

end
