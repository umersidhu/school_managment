class FeesesController < ApplicationController

  def index
    @months = []
    prev_date = "January 2018"
    m = Date.strptime(prev_date,"%B %Y")
    n = Date.today
    n -= n.day - 1
    while m <= n
      @months << "#{Date::MONTHNAMES[m.month].ljust(8)} #{m.year}"
      m = m >> 1
    end
  end
end
