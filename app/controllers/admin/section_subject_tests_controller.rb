class Admin::SectionSubjectTestsController < Admin::BaseController

  before_action :find_branch_class, :find_section, :find_section_subject, :find_section_subject_test

  def index
    @section_subject_tests = @section_subject.section_subject_tests
  end

  def new
    @section_subject_test = SectionSubjectTest.new
  end

  def create
    @section_subject_test = SectionSubjectTest.new(section_subject_test_params)
    @section_subject_test.section_subject_id = params[:section_subject_id]
    if @section_subject_test.save
      redirect_to admin_branch_class_section_section_subject_section_subject_tests_path(@branch_class, @section, @section_subject)
    else
      render :new
    end
  end

  def show
    @user_tests = @section_subject_test.user_tests
  end

  def edit

  end

  def update
    if @section_subject_test.update(section_subject_test_params)
      flash[:message] = "Test was successfully updated"
    else
      flash[:message] = "Test was not updated"
    end
    redirect_to admin_branch_class_section_section_subject_section_subject_tests_path(@branch_class, @section, @section_subject)
  end

  def destroy
    if @section_subject_test.destroy
      flash[:message] = "Test was successfully deleted"
    else
      flash[:message] = "Test was not deleted"
    end
    redirect_to admin_branch_class_section_section_subject_section_subject_tests_path(@branch_class, @section, @section_subject)
  end

  def find_branch_class
    @branch_class = BranchClass.friendly.find(params[:branch_class_id])
  end

  def find_section
    @section = Section.find_by_id(params[:section_id])
  end

  def find_section_subject
    @section_subject = SectionSubject.find_by_id(params[:section_subject_id])
  end

  def find_section_subject_test
    @section_subject_test = SectionSubjectTest.find_by_id(params[:id])
  end

  def section_subject_test_params
    params.require(:section_subject_test).permit(:section_subject_id, :name, :total_marks)
  end

end
