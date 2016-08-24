class TotalsController < ApplicationController
  def today
    render :json => {
      # :goal => @current_user.goal,
      :total => @current_user.totals.getTotalToday
    }

  end

  def historical
    render :json => {
      :totalArray => @current_user.totals.getTotalWeek
    }

  end
end
