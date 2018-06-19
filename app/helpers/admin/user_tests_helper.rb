module Admin::UserTestsHelper

  def user_name(user_id)
    User.find_by(id: user_id)&.full_name
  end

  def marks_percent(total_marks, obtained_marks)
  	(obtained_marks/total_marks)*100
  end
end
