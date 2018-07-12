module FeesesHelper

  def user_fee(date)
    if current_user.user_fee.pluck(:month).include? date.to_date
      current_user.user_fee&.find_by_month(date.to_date).status
    else
      date
    end
  end
  
end
