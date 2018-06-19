class Admin::UserTestsController < Admin::BaseController
  before_action :find_branch_class, :find_section, :find_section_subject_test
  before_action :find_section_subject, :find_user_test
  
  def new    
    @students = @section.students
    @user_tests= []

    @students.each do |student|
      @user_tests << UserTest.new(user_id: student.id, section_subject_test_id: @section_subject_test.id)
    end

  end

  def create
    user_tests = []
    params[:user_tests].each do |user_test|
      user_tests << UserTest.new(user_id: user_test[:user_id], obtained_marks: user_test[:obtained_marks], section_subject_test_id: @section_subject_test.id)
    end
    UserTest.import user_tests
    redirect_to admin_branch_class_section_section_subject_section_subject_tests_path(@branch_class, @section, @section_subject)
  end

  def edit
  end

  def update
  end

  private

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
    @section_subject_test = SectionSubjectTest.find_by_id(params[:section_subject_test_id])
  end

  def find_user_test
    @user_test = UserTest.find_by_id(params[:id])
  end

end

