class UserTestsController < ApplicationController
  before_action :current_user_subject
  before_action :check_subject_exist, only: [:user_subject_test_report]

  def index
  end

  def user_subject_test_report
    @user_tests = []
    if current_user.user_tests.present?
      current_user.user_tests.each do |ut|
        if ut.section_subject_test.section_subject.subject_id.eql? params[:subject].to_i
          @user_tests << ut
        end
      end
    end
  end

  private

  def current_user_subject
    @subjects = current_user.student_sections&.first&.section&.subjects
  end

  def check_subject_exist
   unless @subjects&.pluck(:id)&.include? params[:subject]&.to_i
    redirect_to user_tests_path
   end
  end

end
