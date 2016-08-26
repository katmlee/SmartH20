class RecordsController < ApplicationController
  def submit_reading
    p params
    reading = params[:reading].to_f
    email = params[:email]
    user = User.find_by :email => email
    latest_total_today = user.totals.last #need to ask about User.last

    if  latest_total_today == nil || latest_total_today.created_at < DateTime.now.beginning_of_day #if it is a new day start a new counter for total water consumption
      newTotal = Total.new
      newTotal.total_consumed = 0
      newTotal.date = Time.zone.today
      newTotal.user_id = user.id
      newTotal.save
    else #if total for the day has already been created add last sip to total
      if (Record.last.outcome - reading) > 0
        latest_total_today.total_consumed+= Record.last.outcome - reading
        latest_total_today.save
        # Total where created_at is today
      end
    end


    record = Record.new
    record.outcome = reading
    record.user_id = user.id
    record.save

    head :ok, content_type: "text/html"

    # if this reading is the first for today
    # calculate_previous_day_total
    # save to new statistics table
    # if today is different from record.last.day then
    # get outcomes for record.last.day and then calculate totalconsumed and save to total consumed model

  end

  def new

  end

  # def today
  #   render :json => {
  #     # :goal => @current_user.goal,
  #     :change => @current_user.records.today_change_array,
  #     :outcome => @current_user.records.today_outcome_array
  #   }
  # end
  #
  # def historical
  #     @records = @current_user.by_day
  #     results = {};
  #     @records.each do |date, outcome|
  #       results[date] ||= []
  #       results[date] << outcome
  #     end
  #
  #   render :json => {
  #     :data => @current_user.by_day
  #   }
  # end
end
