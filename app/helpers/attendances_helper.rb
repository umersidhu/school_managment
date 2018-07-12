module AttendancesHelper

  def user_attendance(date)
    if current_user.attendances.pluck(:attendance_date).include? date.to_date
      current_user.attendances&.find_by_attendance_date(date.to_date).status
    else
      date
    end
  end
end
