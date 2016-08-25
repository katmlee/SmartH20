class TotalsController < ApplicationController
  def today
    @todayTotal = @current_user.totals.getTotalToday
    @notification = <%= @todayTotal  %>
    render :json => {
      # :goal => @current_user.goal,
      :total => @todayTotal
    }

  end

  def historical
    render :json => {
      :totalArray => @current_user.totals.getTotalWeek
    }

  end

end
