class AttendancesController < ApplicationController

  def index
    @month_dates = (Time.now.beginning_of_month.to_date..Time.now.end_of_month.to_date).map{ |date| date }
  end

  def previous_month_dates
    end_month    = (params[:current_month].to_date - 1.day)
    start_month  = end_month.beginning_of_month
    @month_dates = (start_month.to_date..end_month.to_date).map{ |date| date }
    respond_to do |format|
      format.js
    end
  end

  def next_month_dates
    current_month = (params[:current_month].to_date)
    start_month = (current_month.end_of_month + 1.day)
    end_month    = start_month.end_of_month
    if (start_month > Time.now.to_date)
      @month_dates = (Time.now.beginning_of_month.to_date..Time.now.end_of_month.to_date).map{ |date| date }
    else
      @month_dates = (start_month.to_date..end_month.to_date).map{ |date| date }
    end
    respond_to do |format|
        format.js
      end
  end
end
