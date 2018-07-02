module Admin::AttendancesHelper

  def check_date(date, section)
    d = date.strftime("%Y-%m-%d")
    section = Section.find_by(id: section.id)
    attendance = section.attendances.find_by(attendance_date: d)
    attendance.id.present? unless attendance.blank?
  end
end
